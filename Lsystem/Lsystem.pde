float angle=radians(45);
float len = 100;
String sentence = "F";
ArrayList<Rule> rules = new ArrayList<Rule>();

void setup() {
  size(600, 600);
  Rule tRule = new Rule('F', "FF+[+F-F-F]-[-F+F=F]");
  rules.add(tRule);
  println(sentence);
  generate();
  generate();
}


void generate() {
  len*=0.5;
  String newSentence = "";
  for (int i = 0; i < sentence.length(); i++){
    char current = sentence.charAt(i);
    boolean found = false;
    for(int j = 0; j < rules.size(); j++){
      if(current == rules.get(j).a){
        found = true;
        newSentence += rules.get(j).b;
        break;
      }
    }
    
    if(!found){
      newSentence += current;
    }
  }
  sentence = newSentence;
  println(sentence);
  turtle();
}

void turtle(){
  background(51);
  resetMatrix();
  translate(width/2, height);
  stroke(255, 100);
  print(sentence.length());
  for(int i = 0; i < sentence.length(); i++){
    char current = sentence.charAt(i);
    println(current);
    if(current == 'F'){
      line(0, 0, 0, -len);
      translate(0,-len);
    }else if(current == '+'){
      rotate(angle);

    }else if(current == '-'){
      rotate(-angle);
    }else if(current == '['){
      pushMatrix();
    }else if(current == ']'){
      popMatrix();
    }
    
  }
}