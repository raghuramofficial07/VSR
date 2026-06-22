// All data for Such Jaano lives in this browser's localStorage.
// Nothing is sent anywhere — there is no server, no account, no sync.

const POSTS_KEY = 'such-jaano:posts'
const PROFILE_KEY = 'such-jaano:profile'

export function loadProfile() {
  try {
    const raw = localStorage.getItem(PROFILE_KEY)
    return raw ? JSON.parse(raw) : null
  } catch {
    return null
  }
}

export function saveProfile(profile) {
  localStorage.setItem(PROFILE_KEY, JSON.stringify(profile))
}

export function loadPosts() {
  try {
    const raw = localStorage.getItem(POSTS_KEY)
    return raw ? JSON.parse(raw) : []
  } catch {
    return []
  }
}

export function savePosts(posts) {
  localStorage.setItem(POSTS_KEY, JSON.stringify(posts))
}

export function makeId() {
  return `${Date.now()}-${Math.random().toString(36).slice(2, 9)}`
}
