export const reverseString = (string) => {
    let result = [];

    string.split('').forEach((char) => result.unshift(char));

    return result.join('')
};
