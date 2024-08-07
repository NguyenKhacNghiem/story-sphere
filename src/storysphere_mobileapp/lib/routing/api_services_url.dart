class APIUrlSerivces {
  //STORY SPHERE API
  //DEVELOPE
    //static const server = 'http://localhost:3000/';
    //static const server = 'http://192.168.1.6:3000/'; //call from physical device

  //Stagging
  static const server = 'https://story-sphere-j0c8.onrender.com/';

  //login
  static const loginService = '${server}user/login';

  //cloud service
  static const cloudService = '${server}cloudinary';

  //forgot password
  static const forgotPasswordService = '${server}user/forget-password';
  static const verifyEmailService = '${server}user/verify-email';

  //searching - filtering
  static const filter = '${server}story/filter';
  static const search = '${server}story/search';

  //library
  static const favBook = '${server}fav-book';

  //reading history
  static const readingHistory = '${server}reading-history';

  //story detail
  static const story = '${server}story';
  static const category = '${server}category/no-paging';
  static const review = '${server}review-story';

  //chapter
  static const chapter  = '${server}chapter';

  //comment
  static const comment = '${server}comment';

  //my works
  static const createStory = '${server}story/create';

  //user
  static const account = '${server}user';
}