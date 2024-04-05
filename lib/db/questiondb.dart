

import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';


class QuestionDatabase{
  List  questionList=[];
  
final mybox=Hive.box('mybox');

void getData()
{
   questionList=mybox.get("QUESTIONLIST")??[];
}
void updateDatabase()
{
 questionList=mybox.put("QUESTIONLIST",  questionList) as List ;
}
void createInitialData(){
  questionList = [
  [
    "Which planet is known as the 'Red Planet'?",
    "Venus",
    "Mars",
    "Jupiter",
    "Saturn",
    "Mercury",
    "b"
  ],
  [
    "What is the largest mammal in the world?",
    "Elephant",
    "Blue Whale",
    "Giraffe",
    "Gorilla",
    "Hippopotamus",
    "b"
  ],
  [
    "Which country is known as the 'Land of the Rising Sun'?",
    "China",
    "South Korea",
    "Japan",
    "Vietnam",
    "Thailand",
    "c"
  ],
  [
    "Who wrote the play 'Romeo and Juliet'?",
    "Charles Dickens",
    "William Shakespeare",
    "Jane Austen",
    "Mark Twain",
    "Emily Brontë",
    "b"
  ],
  [
    "What is the capital city of Canada?",
    "Ottawa",
    "Toronto",
    "Vancouver",
    "Montreal",
    "Calgary",
    "a"
  ],
  [
    "Which gas do plants absorb from the atmosphere during photosynthesis?",
    "Oxygen",
    "Nitrogen",
    "Carbon Dioxide",
    "Hydrogen",
    "Methane",
    "c"
  ],
  [
    "In what year did World War II end?",
    "1943",
    "1945",
    "1947",
    "1950",
    "1952",
    "b"
  ],
  [
    "Who painted the Mona Lisa?",
    "Vincent van Gogh",
    "Leonardo da Vinci",
    "Pablo Picasso",
    "Michelangelo",
    "Rembrandt",
    "b"
  ],
  [
    "What is the currency of Japan?",
    "Yuan",
    "Yen",
    "Won",
    "Ringgit",
    "Baht",
    "b"
  ],
  [
    "Which element has the chemical symbol 'H'?",
    "Helium",
    "Hydrogen",
    "Hafnium",
    "Holmium",
    "Hassium",
    "b"
  ],
  [
    "Who is the author of 'To Kill a Mockingbird'?",
    "J.K. Rowling",
    "Harper Lee",
    "George Orwell",
    "Ernest Hemingway",
    "F. Scott Fitzgerald",
    "b"
  ],
  [
    "What is the largest ocean on Earth?",
    "Atlantic Ocean",
    "Indian Ocean",
    "Southern Ocean",
    "Arctic Ocean",
    "Pacific Ocean",
    "e"
  ],
  [
    "Who is known as the 'Father of Modern Physics'?",
    "Isaac Newton",
    "Albert Einstein",
    "Galileo Galilei",
    "Nikola Tesla",
    "Marie Curie",
    "b"
  ],
  [
    "Which planet is closest to the Sun?",
    "Venus",
    "Earth",
    "Mars",
    "Mercury",
    "Jupiter",
    "d"
  ],
  [
    "In what year did the Titanic sink?",
    "1905",
    "1912",
    "1920",
    "1931",
    "1944",
    "b"
  ],
  [
    "Who wrote 'The Canterbury Tales'?",
    "Geoffrey Chaucer",
    "William Wordsworth",
    "John Milton",
    "Jane Austen",
    "Charles Dickens",
    "a"
  ],
  [
    "What is the capital of Brazil?",
    "Buenos Aires",
    "Rio de Janeiro",
    "Brasília",
    "Sao Paulo",
    "Salvador",
    "c"
  ],
  [
    "Which planet is known as the 'Blue Planet'?",
    "Earth",
    "Neptune",
    "Uranus",
    "Saturn",
    "Jupiter",
    "a"
  ],
  [
    "Who was the first woman to win a Nobel Prize?",
    "Marie Curie",
    "Florence Nightingale",
    "Mother Teresa",
    "Rosa Parks",
    "Amelia Earhart",
    "a"
  ],
  [
    "What is the longest river in the world?",
    "Amazon River",
    "Nile River",
    "Yangtze River",
    "Mississippi River",
    "Ganges River",
    "a"
  ],
  [
    "In what year did the United States declare its independence?",
    "1765",
    "1776",
    "1789",
    "1800",
    "1812",
    "b"
  ],
  [
    "Who painted 'Starry Night'?",
    "Claude Monet",
    "Pablo Picasso",
    "Vincent van Gogh",
    "Leonardo da Vinci",
    "Georgia O'Keeffe",
    "c"
  ],
  [
    "What is the capital of Australia?",
    "Sydney",
    "Melbourne",
    "Canberra",
    "Brisbane",
    "Perth",
    "c"
  ],
  [
    "Which gas makes up the majority of Earth's atmosphere?",
    "Nitrogen",
    "Oxygen",
    "Carbon Dioxide",
    "Argon",
    "Hydrogen",
    "a"
  ],
  [
    "Who is the Greek god of war?",
    "Zeus",
    "Poseidon",
    "Ares",
    "Apollo",
    "Hermes",
    "c"
  ],
  [
    "What is the currency of China?",
    "Yuan",
    "Yen",
    "Won",
    "Ringgit",
    "Baht",
    "a"
  ],
  [
    "Who is known as the 'Father of Computers'?",
    "Alan Turing",
    "Charles Babbage",
    "Bill Gates",
    "Steve Jobs",
    "Ada Lovelace",
    "b"
  ],
  [
    "What is the largest desert in the world?",
    "Sahara Desert",
    "Arabian Desert",
    "Gobi Desert",
    "Antarctica",
    "Kalahari Desert",
    "d"
  ],
  [
    "Who discovered penicillin?",
    "Alexander Fleming",
    "Louis Pasteur",
    "Joseph Lister",
    "Marie Curie",
    "Robert Koch",
    "a"
  ],
  [
    "Which country is known as the 'Land of the Rising Sun'?",
    "China",
    "South Korea",
    "Japan",
    "Vietnam",
    "Thailand",
    "c"
  ],
  [
    "Who wrote '1984'?",
    "George Orwell",
    "Aldous Huxley",
    "Ray Bradbury",
    "J.K. Rowling",
    "H.G. Wells",
    "a"
  ],
  ];

}
}