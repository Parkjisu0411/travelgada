<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="">
<head>

<meta charset="UTF-8">
<title>CodePen Demo</title>


<link rel="shortcut icon" type="image/x-icon"
	href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
<link rel="mask-icon" type=""
	href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg"
	color="#111">
<link rel="canonical" href="https://codepen.io/petrgazarov/pen/JyXvzB">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto+Slab">

<script
	src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeConsoleRunner-d8236034cc3508e70b0763f2575a8bb5850f9aea541206ce56704c013047d712.js"></script>
<script
	src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-4793b73c6332f7f14a9b6bba5d5e62748e9d1bd0b5c52d7af6376f3d1c625d7e.js"></script>
<script
	src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRuntimeErrors-4f205f2c14e769b448bcf477de2938c681660d5038bc464e3700256713ebe261.js"></script>
<style type="text/css">
.input-wrapper {
	position: relative;
	width: 500px;
	margin: 50px auto;
}

.input-highlight {
	font-size: 30px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	line-height: 70px;
	border-top: 3px solid white;
	position: absolute;
	left: 0;
	bottom: 0;
	max-width: 100%;
	height: 0;
	color: transparent;
	font-family: Roboto Slab, sans-serif;
	overflow: hidden;
}

input:focus + .input-highlight {
	border-top: 3px solid #1dcad3;
}

input{
	height: 60px;
	width: 100%;
	min-width: 100%;
	padding: 0;
	border-radius: 0;
	line-height: 70px;
	background-color: transparent;
	color: black;
	font-size: 30px;
	border: none;
	outline: none;
	border-bottom: 3px solid #333333;
	font-family: Roboto Slab, sans-serif;

}

</style>

</head>


<body translate="no">

	<div id="root">
		<div data-reactroot="" class="input-wrapper">
			<input class="search_bar_style" placeholder="Search..." value=""
				spellcheck="false"> 
			<span class="input-highlight"> </span>
		</div>
	</div>
	<script
		src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/react/15.5.0/react.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/react/15.5.0/react-dom.js"></script>

	<script id="rendered-js">
class App extends React.Component {
  constructor() {
    super();

    this.state = {
      inputValue: '' };


    this.onInputChange = this.onInputChange.bind(this);
  }

  onInputChange(e) {
    const { value } = e.target;

    this.setState({
      inputValue: value });

  }

  render() {
    const { inputValue } = this.state;

    return /*#__PURE__*/(
      React.createElement("div", { className: "input-wrapper" }, /*#__PURE__*/
      React.createElement("input", {
        onChange: this.onInputChange,
        placeholder: "Search...",
        value: inputValue,
        spellCheck: false }), /*#__PURE__*/

      React.createElement("span", { className: "input-highlight" },
      inputValue.replace(/ /g, "\u00a0"))));



  }}


ReactDOM.render( /*#__PURE__*/
React.createElement(App, null),
document.getElementById('root'));
//# sourceURL=pen.js

</script>

</body>
</html>