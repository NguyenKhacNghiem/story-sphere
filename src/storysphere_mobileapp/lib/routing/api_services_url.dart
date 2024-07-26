class APIUrlSerivces {
  //STORY SPHERE API
  //DEVELOPE
    //static const server = 'http://localhost:3000/';
    static const server = 'http://192.168.1.6:3000/'; //call from physical device

  //Stagging
  //static const server = 'http://localhost:3000/';

  //login
  static const loginService = '${server}user/login';

  //forgot password
  static const forgotPasswordService = '${server}user/forget-password';
  static const verifyEmailService = '{$server}user/verify-email';

  //searching - filtering
  static const filter = '${server}story/filter';
  static const search = '${server}story/search';

  //story detail
  static const storyById = '${server}story/id';

  //chapter
  static const chapter  = '${server}chapter';

  //my works
  static const createStory = '${server}story/create';
}