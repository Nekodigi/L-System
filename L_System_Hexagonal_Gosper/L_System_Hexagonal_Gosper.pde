float angle=radians(60);
float len;
String sentence = "XF";
ArrayList<Rule> rules = new ArrayList<Rule>();
float prevKD = 2;//previous data which need to culculate edge length.

void setup() {
  //size(600, 600);
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  rules.add(new Rule('X', "X+YF++YF-FX--FXFX-YF+"));
  rules.add(new Rule('Y', "-FX+YFYF++YF+FX--FX-Y"));
  len = height/1.5;
  println(sentence);
  strokeWeight(10);
  generate(2.8);
  for(float i = 1; i < 8; i++){
    
  }
  //generate(1./((2*3+2)/2.));
  //generate(1./((8*3+2)/8.));
  //generate(1./((26*3+2)/26.));
  //generate(1./4);
  //generate(1./(1*2+1));
  //generate(3./(3*2+1));
}

void mousePressed(){
  generate(2.8);
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
  translate(width/2, height/2);
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
