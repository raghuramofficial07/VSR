import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.jsx'
import DotGridBackground from './Assests/Backgrounds/Background.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <>
      <DotGridBackground />
      <App />
    </>
  </StrictMode>,
)
