/* simple imperative solution */
let n = 1000
let prod = ref(0)

for (a in 1 to n) {
	for (b in 1 to n) {
   		let c = n - a - b
    	if (a*a + b*b == c*c) { prod := a*b*c }
  	}
}

Js.log(prod)