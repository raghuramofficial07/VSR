import { useEffect, useMemo, useState } from 'react'
import { loadProfile, saveProfile, loadPosts, savePosts, makeId } from './storage'

const MAX_LEN = 280

function timeAgo(ts) {
  const diff = Math.max(0, Date.now() - ts)
  const sec = Math.floor(diff / 1000)
  if (sec < 5) return 'just now'
  if (sec < 60) return `${sec}s ago`
  const min = Math.floor(sec / 60)
  if (min < 60) return `${min}m ago`
  const hr = Math.floor(min / 60)
  if (hr < 24) return `${hr}h ago`
  const day = Math.floor(hr / 24)
  if (day < 7) return `${day}d ago`
  return new Date(ts).toLocaleDateString()
}

function ProfileGate({ onDone }) {
  const [name, setName] = useState('')
  const [error, setError] = useState('')

  function submit(e) {
    e.preventDefault()
    const trimmed = name.trim()
    if (!trimmed) {
      setError('a name is needed before you can post')
      return
    }
    if (trimmed.length > 32) {
      setError('keep it under 32 characters')
      return
    }
    const profile = { name: trimmed, createdAt: Date.now() }
    saveProfile(profile)
    onDone(profile)
  }

  return (
    <div className="gate">
      <div className="grid-bg" aria-hidden="true" />
      <div className="gate-card">
        <h1 className="brand">
          such jaano<span className="accent">+</span>
        </h1>
        <p className="gate-copy">
          a microblog that never leaves this device. no account, no
          server, no google login — just a name, so your posts know
          whose they are.
        </p>
        <form onSubmit={submit} className="gate-form">
          <label htmlFor="name-input" className="sr-only">
            your name
          </label>
          <input
            id="name-input"
            autoFocus
            value={name}
            onChange={(e) => {
              setName(e.target.value)
              setError('')
            }}
            placeholder="what should we call you?"
            maxLength={32}
          />
          <button type="submit">begin.</button>
        </form>
        {error && <p className="gate-error">{error}</p>}
      </div>
    </div>
  )
}

function Composer({ author, onPost }) {
  const [text, setText] = useState('')
  const remaining = MAX_LEN - text.length
  const over = remaining < 0

  function submit(e) {
    e.preventDefault()
    const trimmed = text.trim()
    if (!trimmed || over) return
    onPost(trimmed)
    setText('')
  }

  return (
    <form className="composer" onSubmit={submit}>
      <div className="composer-head">
        <span className="composer-name">{author}</span>
        <span className={`counter ${over ? 'counter-over' : ''}`}>
          {remaining}
        </span>
      </div>
      <textarea
        value={text}
        onChange={(e) => setText(e.target.value)}
        placeholder="what's true right now?"
        rows={3}
      />
      <div className="composer-foot">
        <span className="composer-hint">stored only on this device</span>
        <button type="submit" disabled={!text.trim() || over}>
          post.
        </button>
      </div>
    </form>
  )
}

function PostCard({ post, onLike, onDelete }) {
  return (
    <article className="post">
      <header className="post-head">
        <span className="post-author">{post.author}</span>
        <span className="post-time">{timeAgo(post.createdAt)}</span>
      </header>
      <p className="post-body">{post.text}</p>
      <footer className="post-foot">
        <button className="like" onClick={() => onLike(post.id)}>
          ♥ {post.likes}
        </button>
        <button className="delete" onClick={() => onDelete(post.id)}>
          delete
        </button>
      </footer>
    </article>
  )
}

function EmptyState() {
  return (
    <div className="empty">
      <p>nothing here yet.</p>
      <p>write the first thing that's true right now.</p>
    </div>
  )
}

export default function App() {
  const [profile, setProfile] = useState(() => loadProfile())
  const [posts, setPosts] = useState(() => loadPosts())
  const [menuOpen, setMenuOpen] = useState(false)

  useEffect(() => {
    savePosts(posts)
  }, [posts])

  const sorted = useMemo(
    () => [...posts].sort((a, b) => b.createdAt - a.createdAt),
    [posts]
  )

  function addPost(text) {
    const next = {
      id: makeId(),
      author: profile.name,
      text,
      createdAt: Date.now(),
      likes: 0,
    }
    setPosts((p) => [next, ...p])
  }

  function likePost(id) {
    setPosts((p) =>
      p.map((post) =>
        post.id === id ? { ...post, likes: post.likes + 1 } : post
      )
    )
  }

  function deletePost(id) {
    setPosts((p) => p.filter((post) => post.id !== id))
  }

  function exportData() {
    const blob = new Blob([JSON.stringify(posts, null, 2)], {
      type: 'application/json',
    })
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = 'such-jaano-export.json'
    a.click()
    URL.revokeObjectURL(url)
    setMenuOpen(false)
  }

  function clearAll() {
    if (
      window.confirm(
        'delete every post on this device? this cannot be undone.'
      )
    ) {
      setPosts([])
    }
    setMenuOpen(false)
  }

  function renameProfile() {
    const next = window.prompt('your new name', profile.name)
    const trimmed = next?.trim()
    if (trimmed) {
      const updated = { ...profile, name: trimmed }
      saveProfile(updated)
      setProfile(updated)
    }
    setMenuOpen(false)
  }

  if (!profile) {
    return <ProfileGate onDone={setProfile} />
  }

  return (
    <div className="app">
      <div className="grid-bg" aria-hidden="true" />
      <header className="topbar">
        <h1 className="brand">
          such jaano<span className="accent">+</span>
        </h1>
        <button
          className="menu-btn"
          aria-label="menu"
          onClick={() => setMenuOpen((v) => !v)}
        >
          ≡
        </button>
        {menuOpen && (
          <div className="menu">
            <button onClick={renameProfile}>rename</button>
            <button onClick={exportData}>export json</button>
            <button onClick={clearAll}>clear all</button>
          </div>
        )}
      </header>

      <main className="main">
        <Composer author={profile.name} onPost={addPost} />

        <div className="feed">
          {sorted.length === 0 ? (
            <EmptyState />
          ) : (
            sorted.map((post) => (
              <PostCard
                key={post.id}
                post={post}
                onLike={likePost}
                onDelete={deletePost}
              />
            ))
          )}
        </div>
      </main>

      <footer className="footer">
        <p>
          © {new Date().getFullYear()} such jaano. lives on your device
          &middot; nowhere else.
        </p>
      </footer>
    </div>
  )
}
