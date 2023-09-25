//
// This is only a SKELETON file for the 'Forth' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class Forth {
    constructor() {
        this._stack = []
    }

    evaluate(input) {
        let inputArr = input.split(' ');

        inputArr.forEach(elem => {
            let word = elem.toLowerCase();

            if (word == 'dup') {
                this.validateLength(1);
                this.stack = this.stack[this.stack.length - 1]
            } else if (word == 'drop') {
                this.validateLength(1);
                this.stack.pop();
            } else if (word == 'swap') {
                this.validateLength(2);

                let n1 = this.stack.pop();
                let n2 = this.stack.pop();

                this.stack = n1;
                this.stack = n2;
            } else if (word == 'over') {
                this.validateLength(2);
                this.stack = this.stack[this.stack.length - 2]
            } else if (elem == '+') {
                this.validateLength(2);

                let n1 = this.stack.pop();
                let n2 = this.stack.pop();

                this.stack = n1 + n2;
            } else if (elem == '-') {
                this.validateLength(2);

                let n1 = this.stack.pop();
                let n2 = this.stack.pop();
                this.stack = n2 - n1;
            } else if (elem == '*') {
                this.validateLength(2);

                let n1 = this.stack.pop();
                let n2 = this.stack.pop();
                this.stack = n1 * n2;
            } else if (elem == '/') {
                this.validateLength(2);
                this.applyDivision();
            } else {
                this.stack = parseInt(word)
            }
        });
    }

    get stack() {
        return this._stack
    }

    set stack(elem) {
        this._stack.push(elem)
    }

    validateLength(test) {
        if (this.stack.length < test) throw new Error('Stack empty');
    }

    applyDivision() {
        let n1 = this.stack.pop();
        let n2 = this.stack.pop();

        if (n1 == 0) throw new Error('Division by zero');

        this.stack = Math.floor(n2 / n1);
    }
}
