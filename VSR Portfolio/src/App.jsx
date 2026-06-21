import { useState } from 'react'
import DotGridBackground from './Assests/Backgrounds/Background'
import profileimg from '/Users/vemparalaraghuram/my-site/src/assets/VSR.png'
import project1 from '/Users/vemparalaraghuram/my-site/src/assets/project1.png'
import project2 from '/Users/vemparalaraghuram/my-site/src/assets/project2.png'
import project3 from '/Users/vemparalaraghuram/my-site/src/assets/project2.png'
import './App.css'

const projects = [
  { id: 1, image: project1, title: "SuchJaano (iOS)", about: "A native iOS microblogging app featuring Apple's latest Liquid Glass UI, battery-optimized performance, and recorded demo previews. Built with Swift and UIKit — smooth, fast, and native to the core.", github: "https://github.com/raghuramofficial07/VSR/tree/main/SuchJaano" },
  { id: 2, image: project2, title: "SuchJaano (Web)", about: "The web version of Such Jaano — bringing the same microblogging experience to the browser. Built with the MERN stack, replicating the iOS feel with a new architecture.", github: "https://github.com/raghuramofficial07/VSR/tree/main/SuchJaano" },
  { id: 3, image: project3, title: "MERN Stack(Web)", about: "A MERN stack project built around REST API consumption — Express handles routing, MongoDB stores the data, and React renders it. A complete full-stack loop from frontend to database and back.", github: "https://github.com/raghuramofficial07/Web-Dev/tree/main/SAMPLE-MERN-STACK-PROJECT" },
]

const skills = [
  { id: 1, name: "C", icon: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/c/c-original.svg" },
  { id: 2, name: "C++", icon: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/cplusplus/cplusplus-original.svg" },
  { id: 3, name: "Swift", icon: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/swift/swift-original.svg" },
  { id: 4, name: "JavaScript", icon: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" },
  { id: 5, name: "React", icon: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/react/react-original.svg" },
]
const socials = [
  { id: 1, name: "LinkedIn", url: "https://linkedin.com/in/raghuram1241", icon: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linkedin/linkedin-original.svg" },
  { id: 2, name: "GitHub", url: "https://github.com/raghuramofficial07", icon: "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" },
  { id: 3, name: "Reddit", url: "https://www.reddit.com/user/vssraghuram", icon: "https://cdn.simpleicons.org/reddit/FF4500" },
  { id: 4, name: "Quora", url: "https://www.quora.com/profile/Vemparala-Sri-Satya-Raghuram", icon: "https://cdn.simpleicons.org/quora/B92B27" },
  { id: 5, name: "YouTube", url: "https://www.youtube.com/@vsrglobalhere", icon: "https://cdn.simpleicons.org/youtube/FF0000" },
]

function App() {
  const [menuOpen, setMenuOpen] = useState(false);
  return (
    <>
      <DotGridBackground />
      <div className="hero-sec">

        {/* ── NAV ── */}
        <nav className="nav">
          <div className="logo">
            RaghuRam<span className="dot">.</span>
          </div>

          <ul className="nav-links">
            <li><a href="#home">Home</a></li>
            <li><a href="#projects">Projects</a></li>
            <li><a href="#skills-sec">Skills</a></li>
            <li><a href="mailto:vemparalaraghuram@gmail.com">Contact</a></li>
          </ul>

          <div
            className={`hamburger ${menuOpen ? "open" : ""}`}
            onClick={() => setMenuOpen(!menuOpen)}
            aria-label="Toggle menu"
          >
            <span></span>
            <span></span>
            <span></span>
          </div>
        </nav>

        {/* ── MOBILE DRAWER ── */}
        <div className={`mobile-menu ${menuOpen ? "open" : ""}`}>
          <a href="#">Home</a>
          <a href="#">Projects</a>
          <a href="#">Skills</a>
          <a href="#">Contact</a>
        </div>
        <div className="home" id="home">
          <img src={profileimg} alt="Raghuram's Image" />
          <div className="home-text">
            <h1>I'm Raghuram<span className="dot">.</span></h1>
            <p>
              Started with Swift and MVVM. Now I'm routing requests through Express,
              pushing data through MongoDB, and making React do exactly what I want.
              The stack changed — the obsession didn't.
            </p>
          </div>
        </div>

        {/* ── PROJECTS ── */}
        <div className="projects" id="projects">
          <div className="projects-grid">
            {projects.map((proj) => (
              <div className="project-card" key={proj.id}>
                <img src={proj.image} alt={proj.title} />
                <h2>{proj.title}<span className="dot">.</span></h2>
                <p>{proj.about}</p>
                <a href={proj.github} target="_blank" rel="noreferrer" className="proj-link">
                  View Repo<span className="dot">.</span>
                </a>
              </div>
            ))}
          </div>
        </div>

        <div className="skills-sec" id="skills-sec">
          {skills.map((skill) => (
            <div className="skill-card" key={skill.id}>
              <img src={skill.icon} alt={skill.name} />
              <p>{skill.name}<span className="dot">.</span></p>
            </div>
          ))}
        </div>



      </div>

      {/* ── FOOTER ── */}
      <footer className="footer">
        <div className="footer-links">
          {socials.map((s) => (
            <a key={s.id} href={s.url} target="_blank" rel="noreferrer" className="social-card">
              <img src={s.icon} alt={s.name} />
              <span>{s.name}<span className="dot">.</span></span>
            </a>
          ))}
        </div>

        <img
          src="https://user-images.githubusercontent.com/73097560/115834477-dbab4500-a447-11eb-908a-139a6edaec5c.gif"
          width="100%"
          alt="divider"
          className="footer-divider"
        />

        <p className="footer-copy">© 2026 RaghuRam<span className="dot">.</span> Vision · Shine · Rule</p>
      </footer>
    </>
  );
}

export default App