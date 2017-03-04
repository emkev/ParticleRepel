
/*  Base on Daniel Shiffman 's code 

    2017.02.16 am 04:28

*/

ParticleSystem ps ;
PVector gravity ;

void setup() {
  size( 640 , 360 ) ;
  
  gravity = new PVector(0 , 0.1) ;
  ps = new ParticleSystem() ;  
}


void draw() {
  background(200) ;
  
  ps.addParticle( random(width) , random(height) ) ;
  
  ps.applyForce( gravity ) ;
  ps.intersection() ;
  
  ps.run() ;
  ps.display() ;
  
}
