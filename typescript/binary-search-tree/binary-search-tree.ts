export class BinarySearchTree {
    _data: number;
    _left: BinarySearchTree | undefined;
    _right: BinarySearchTree | undefined;

    constructor(data: number) { this._data = data }

    public get data(): number { return this._data }
    public get left(): BinarySearchTree | undefined { return this._left }
    public get right(): BinarySearchTree | undefined { return this._right }

    public set right(node: BinarySearchTree | undefined) {
        this.right == undefined ? this._right = node : this.right.insert(node);
    }

    public set left(node: BinarySearchTree | undefined) {
        this.left == undefined ? this._left = node : this.left.insert(node);
    }

    public insert(item: BinarySearchTree | number | undefined) {
        if (!item) return

        let node = item instanceof BinarySearchTree ? item : new BinarySearchTree(item);

        node.data <= this.data ? this.left = node : this.right = node;
    }

    public each(callback: (data: number) => void): void {
        this.left?.each(callback);
        callback(this.data);
        this.right?.each(callback);
    }
}
