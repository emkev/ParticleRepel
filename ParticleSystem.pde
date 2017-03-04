
/*  2017.02.16 am 04:31

*/

class ParticleSystem {

  ArrayList<Particle> particles ;
  //float psLocX ;
  //float psLocY ;
  
  ParticleSystem() {    
    particles = new ArrayList<Particle>() ;
    //psLocX = lx ;
    //psLocY = ly ;
  }
  
  void addParticle( float lx , float ly ) {
    particles.add( new Particle( lx , ly ) );
  }
  
  /* It is necessary for an independent apply-force function 
     in the system of particles .
   */
  void applyForce( PVector force ) {
    for( Particle p : particles ) {
      p.applyForce( force ) ;
    }
  }
  
  
  void intersection() {
    for( Particle p : particles ) {
      p.intersects( particles ) ;
    } 
  }
  
  void display() {
    for( Particle p : particles ) {
      p.display() ;
    }
  }
  
  void run() {

    for( int i = particles.size()-1 ;  i >= 0 ;  i-- ) {
      Particle p = particles.get(i) ;      
      p.run() ;
     
      if( p.isDead() ) {
        particles.remove(i) ;
      }
    }    
    
  }
  
}
