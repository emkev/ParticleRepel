
/*  2017.02.16 am 04:29

*/

class Particle {
  
  PVector location ;
  PVector velocity ;
  PVector acceleration ;

  float r ;
  float lifespan ;
  float mass ;
  
  Particle( float lx , float ly ) {
    location = new PVector( lx , ly ) ;
    velocity = new PVector(0 , 0) ;
    acceleration = new PVector(0 , 0) ;
    
    r = 8.0 ;
    lifespan = 255.0 ;
    mass = 2.0 ;
  }
    
  void run() {
    update();
    display();
  }
  
  void applyForce( PVector force ) {
    PVector f = force.get() ;
    f.div( mass ) ;
    acceleration.add( f );
  }
  
    
  void update() {
    velocity.add(acceleration);
    location.add(velocity);

    acceleration.mult(0);

    lifespan -= 2.0;
  }


  void intersects( ArrayList<Particle> ps ) {
    
    for( Particle other : ps ) {
      
      if( other != this ) {
        
        PVector dir = PVector.sub( location , other.location ) ;
        
        if( dir.mag() < r*4 ) {
          dir.setMag( 0.5 ) ;
          applyForce( dir ) ;
        }
        
      }
    }
    
  }


  void display() {
    stroke(0 , lifespan);
    fill(175 , lifespan);   
    ellipse(location.x , location.y , r*2 , r*2);
  }
 
  
  boolean isDead() {
    if(lifespan <= 0.0) {
      return true;
    }
    else {
      return false;
    }
  }
  
}
