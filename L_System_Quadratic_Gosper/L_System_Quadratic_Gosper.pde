float angle=radians(90);
float len;
String sentence = "-YF";
ArrayList<Rule> rules = new ArrayList<Rule>();
float prevKD = 2;//previous data which need to culculate edge length.

void setup() {
  size(600, 600);
  //fullScreen();
  colorMode(HSB, 360, 100, 100);
  rules.add(new Rule('X', "XFX-YF-YF+FX+FX-YF-YFFX+YF+FXFXYF-FX+YF+FXFX+YF-FXYF-YF-FX+FX+YFYF-"));
  rules.add(new Rule('Y', "+FXFX-YF-YF+FX+FXYF+FX-YFYF-FX-YF+FXYFYF-FX-YFFX+FX+YF-YF-FX+FX+YFY"));
  len = height-200;
  println(sentence);
  strokeWeight(10);
  generate(5);
  for(float i = 1; i < 8; i++){
    
  }
}

void mousePressed(){
  generate(5);
}

void draw(){
  
}

void generate(float lenDecay) {
  len/=lenDecay;
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
  //println(sentence);
  turtle();
}

void turtle(){
  background(51);
  resetMatrix();
  translate(width/2+height/2-100, height-100);
  println(sentence.length());
  //count total F for visualize
  float nF = 0;
  float Fi = 0;
  for(int c : sentence.chars().toArray()){if(c=='F')nF++;};
  for(int i = 0; i < sentence.length(); i++){
    char current = sentence.charAt(i);
    if(current == 'F'){
      stroke(Fi/nF*360, 100, 100);
      line(0, 0, 0, -len);
      translate(0,-len);
      Fi++;
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
