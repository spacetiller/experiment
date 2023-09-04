interface User {
    name: string;
    age: number;
}
const userToString = (user: User) => `${user.name}@${user.age}`;
export {userToString, User};
