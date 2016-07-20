# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# KUWTK characters
Char.create({f_name:'Khloe', l_name:'Kardashian', age:33,
   image:'http://img.wennermedia.com/article-leads-vertical-380/khloe-kardashian-zoom-5e874f8c-374d-48ca-99c1-68461e087964.jpg',
   show:'Keeping Up with the Kardashians', episodes:162})
Char.create({f_name:'Kourtney', l_name:'Kardashian', age:37,
   image:'http://ia.media-imdb.com/images/M/MV5BMjA0MjU1NDQyOF5BMl5BanBnXkFtZTcwODU0MTY5MQ@@._V1_.jpg',
   show:'Keeping Up with the Kardashians', episodes:161})
Char.create({f_name:'Kim', l_name:'Kardashian', age:35,
   image:'http://ia.media-imdb.com/images/M/MV5BMjE2NDUzOTYwM15BMl5BanBnXkFtZTgwNjY3MTA4ODE@._V1_SY1000_CR0,0,665,1000_AL_.jpg',
   show:'Keeping Up with the Kardashians', episodes:161})
Char.create({f_name:'Kris', l_name:'Jenner', age:60,
   image:'http://ia.media-imdb.com/images/M/MV5BMTY3Njg5ODAzMV5BMl5BanBnXkFtZTcwNjg0ODg0NQ@@._V1_SY1000_CR0,0,749,1000_AL_.jpg',
   show:'Keeping Up with the Kardashians', episodes:160})
Char.create({f_name:'Kylie', l_name:'Jenner', age:18,
   image:'http://ia.media-imdb.com/images/M/MV5BMjE1NTU4OTY3MV5BMl5BanBnXkFtZTgwMzg4MTA4ODE@._V1_SY1000_CR0,0,665,1000_AL_.jpg',
   show:'Keeping Up with the Kardashians', episodes:149})
Char.create({f_name:'Kendall', l_name:'Jenner', age:20,
   image:'http://ia.media-imdb.com/images/M/MV5BMTE0MjcxNDc3NzleQTJeQWpwZ15BbWU4MDQ2OTcxOTgx._V1_SY1000_CR0,0,666,1000_AL_.jpg',
   show:'Keeping Up with the Kardashians', episodes:148})
Char.create({f_name:'Caitlyn', l_name:'Jenner', age:66,
   image:'http://ia.media-imdb.com/images/M/MV5BMTgxOTk5OTAxN15BMl5BanBnXkFtZTgwMzY1MzgxNjE@._V1_.jpg',
   show:'Keeping Up with the Kardashians', episodes:143})
Char.create({f_name:'Scott', l_name:'Disick', age:33,
   image:'https://pmchollywoodlife.files.wordpress.com/2012/06/scott-disick-bio-photo.jpg?w=330',
   show:'Keeping Up with the Kardashians', episodes:85})
Char.create({f_name:'Rob', l_name:'Kardashian', age:29,
   image:'http://ia.media-imdb.com/images/M/MV5BMjIzMjQxNzc4NV5BMl5BanBnXkFtZTgwNTk4NjYwOTE@._V1_SY1000_CR0,0,803,1000_AL_.jpg',
   show:'Keeping Up with the Kardashians', episodes:70})
Char.create({f_name:'Lamar', l_name:'Odom', age:36,
   image:'http://ia.media-imdb.com/images/M/MV5BODgyMTA5ODI3M15BMl5BanBnXkFtZTcwMjE3NjI4Mg@@._V1_.jpg',
   show:'Keeping Up with the Kardashians', episodes:25})
Char.create({f_name:'Kanye', l_name:'West', age:39,
   image:'http://ia.media-imdb.com/images/M/MV5BMTM0Nzc5ODkyM15BMl5BanBnXkFtZTcwOTczMTgxNw@@._V1_SY1000_CR0,0,675,1000_AL_.jpg',
   show:'Keeping Up with the Kardashians', episodes:14})

#The Bachelorette Characters
Char.create({f_name:'Jordan', l_name:'Rogers',
   image:'http://assets.nydailynews.com/polopoly_fs/1.2648391.1464113443!/img/httpImage/image.jpg_gen/derivatives/article_750/lvrodgers25f-4-web.jpg',
   show:'The Bachelorette', episodes:16})
Char.create({f_name:'Luke', l_name:'Pell',
   image:'http://lovelace-media.imgix.net/uploads/1330/84780850-fa8d-0133-e739-0a315da82319.jpg?',
   show:'The Bachelorette', episodes:14})
Char.create({f_name:'Chase', l_name:'McNary',
   image:'http://www.hollywoodtake.com/sites/default/files/styles/large/public/2016/05/17/chase-mcnary-bachelorette.jpg?itok=t5vLXgRn',
   show:'The Bachelorette', episodes:14})
Char.create({f_name:'Robert', l_name:'Hayes',
   image:'http://az801229.vo.msecnd.net/wetpaint/2016/04/robby33312646517.jpg',
   show:'The Bachelorette', episodes:14})
Char.create({f_name:'JoJo', l_name:'Fletcher',
   image:'http://img2.timeinc.net/people/i/2016/news/160530/jojo-fletcher-435.jpg',
   show:'The Bachelorette', episodes:14})
Char.create({f_name:'Vincent', l_name:'Ventiera',
   image:'https://heavyeditorial.files.wordpress.com/2016/05/142736_1023.jpg?quality=65&strip=all&w=667',
   show:'The Bachelorette', episodes:13})
Char.create({f_name:'James', l_name:'Taylor',
   image:'https://heavyeditorial.files.wordpress.com/2016/05/142736_0233.jpg?quality=65&strip=all&w=667',
   show:'The Bachelorette', episodes:12})
Char.create({f_name:'Alex', l_name:'Woytkiw',
   image:'https://heavyeditorial.files.wordpress.com/2016/07/142736_0507.jpg?quality=65&strip=all&w=667',
   show:'The Bachelorette', episodes:12})
Char.create({f_name:'Derek', l_name:'Peth',
   image:'http://az801229.vo.msecnd.net/wetpaint/2016/05/bachelorette-2016-contestants-derek.jpg',
   show:'The Bachelorette', episodes:11})
Char.create({f_name:'Chad', l_name:'Johnson',
   image:'http://lovelace-media.imgix.net/uploads/528/a9dbcf60-fa87-0133-e738-0a315da82319.jpg?',
   show:'The Bachelorette', episodes:11})


# Public league
League.create({name:'Public League'})

# Available shows
Show.create({name: 'Keeping Up with the Kardashians'})
Show.create({name: 'The Bachelorette'})
