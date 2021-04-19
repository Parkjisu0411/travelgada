<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">

<link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">


  <title>CodePen - pagination</title>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;600&amp;display=swap" rel="stylesheet">
  
  

<style>


:root {
  --primary: #23adad;
  --greyLight: #23adade1;
  --greyLight-2: #cbe0dd;
  --greyDark: #2d4848;
}

*,
*::before,
*::after {
  margin: 0;
  padding: 0;
  box-sizing: inherit;
}

html {
  box-sizing: border-box;
  font-size: 62.5%;
  overflow-y: scroll;
  font-family: "Poppins", sans-serif;
  letter-spacing: 0.6px;
  line-height: 1.4;
  -webkit-user-select: none;
  backface-visibility: hidden;
  -webkit-font-smoothing: subpixel-antialiased;
}

.container {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background: var(--greyLight-2);
  color: var(--greyDark);
}

ul {
  list-style-type: none;
}

.items-list {
  max-width: 90vw;
  margin: 2rem;
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  grid-gap: 3rem;
  justify-content: center;
  align-content: center;
}
@media only screen and (max-width: 600px) {
  .items-list {
    grid-template-columns: repeat(2, 1fr);
  }
}

.item {
  width: 10rem;
  height: 10rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: var(--greyDark);
  cursor: pointer;
}
.item span {
  background: #ffffff;
  box-shadow: 0 0.8rem 2rem rgba(90, 97, 129, 0.05);
  border-radius: 0.6rem;
  padding: 2rem;
  font-size: 3rem;
  transition: all 0.3s ease;
}
.item:hover span {
  transform: scale(1.2);
  color: var(--primary);
}
.item p {
  font-size: 1.2rem;
  margin-top: 1rem;
  color: var(--greyLight);
}

.page {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 5rem;
  margin: 3rem;
  border-radius: 0.6rem;
  background: #ffffff;
  box-shadow: 0 0.8rem 2rem rgba(90, 97, 129, 0.05);
}
.page__numbers, .page__btn, .page__dots {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0.8rem;
  font-size: 1.4rem;
  cursor: pointer;
}
.page__dots {
  width: 2.6rem;
  height: 2.6rem;
  color: var(--greyLight);
  cursor: initial;
}
.page__numbers {
  width: 2.6rem;
  height: 2.6rem;
  border-radius: 0.4rem;
}
.page__numbers:hover {
  color: var(--primary);
}
.page__numbers.active {
  color: #ffffff;
  background: var(--primary);
  font-weight: 600;
  border: 1px solid var(--primary);
}
.page__btn {
  color: var(--greyLight);
  pointer-events: none;
}
.page__btn.active {
  color: var(--greyDark);
  pointer-events: initial;
}
.page__btn.active:hover {
  color: var(--primary);
}



</style>

<script>
  window.console = window.console || function(t) {};
</script>

<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>

</head>
<body>


<div id="app" class="container">  
<ul class="page">
    <li class="page__btn"><span class="material-icons">chevron_left</span></li>
    <li class="page__numbers"> 1</li>
    <li class="page__numbers active">2</li>
    <li class="page__numbers">3</li>
    <li class="page__numbers">4</li>
    <li class="page__numbers">5</li>
    <li class="page__numbers">6</li>
    <li class="page__dots">...</li>
    <li class="page__numbers"> 10</li>
    <li class="page__btn"><span class="material-icons">chevron_right</span></li>
  </ul>
</div>



</body>





</html>