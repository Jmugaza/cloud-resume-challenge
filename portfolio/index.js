const navToggle = document.querySelector('.nav-toggle');
const navLinks = document.querySelectorAll('.nav-link');

navToggle.addEventListener('click', () => {
    document.body.classList.toggle('nav-open');
})

navLinks.forEach(link => {
  link.addEventListener('click', () => {
    document.body.classList.remove('nav-open');
  })
})

// const jobTitleElement = document.getElementById('job-title');
//     const cursorElement = document.querySelector('.cursor');
//     const jobTitles = ['Cloud', 'DevOps', 'Lemon'];
//     let currentJobTitleIndex = 0;

//     async function typeText() {
//       const currentJobTitle = jobTitles[currentJobTitleIndex];
//       const currentText = currentJobTitle.slice(0, jobTitleElement.textContent.length + 1);

//       jobTitleElement.textContent = currentText;

//       cursorElement.style.display = 'inline';

//       if (currentText === currentJobTitle) {
//         setTimeout(eraseText, 2000);
//       } else {
//         setTimeout(typeText, 100);
//       }
//     }

//     async function eraseText() {
//       const currentText = jobTitleElement.textContent;

//       cursorElement.style.display = 'inline';

//       if (currentText.length > 0) {
//         jobTitleElement.textContent = currentText.slice(0, currentText.length - 1);
//         setTimeout(eraseText, 50);
//       } else {
//         currentJobTitleIndex++;
//         if (currentJobTitleIndex >= jobTitles.length) {
//           currentJobTitleIndex = 0;
//         }
//         setTimeout(typeText, 1000);
//       }
//     }

//     typeText();


