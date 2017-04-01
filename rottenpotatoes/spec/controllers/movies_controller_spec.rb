require 'rails_helper'

describe MoviesController do
  describe '#same_director' do
    let(:id) {'1'}
    let(:id3) {'3'}
    let(:director) {'Vyom'}
    let(:movie) {double('movie',:title => 'Alien',:director => director)}
    let(:movie2) {double('movie2',:title => 'Aliens',:director => director)}
    let(:movie3) {double('movie3',:title => 'Star trek',:director => nil)}
    let(:movies) {[movie,movie2]}
   
    context 'When a movie has a director' do
      it 'calls the find method to retrieve a movie' do
        expect(Movie).to receive(:find).with(id).and_return(movie)
        allow(movie).to receive(:director).and_return(director)
        allow(movie).to receive(:find_movies_same_director).and_return(movies)
        get :same_director, {:id => id}
      end
      it 'calls the director getter on the movie' do
        allow(Movie).to receive(:find).with(id).and_return(movie)
        expect(movie).to receive(:director).and_return(director)
        allow(movie).to receive(:find_movies_same_director).and_return(movies)
        get :same_director, {:id => id}
        expect(assigns(:director)).to eq(director)
      end
      it 'calls the model method to find movies with the same director' do
        allow(Movie).to receive(:find).with(id).and_return(movie)
        allow(movie).to receive(:director).and_return(director)
        expect(movie).to receive(:find_movies_same_director).and_return(movies)
        get :same_director, {:id => id}
      end
      it 'selects the same director template for rendering' do
        allow(Movie).to receive(:find).with(id).and_return(movie)
        allow(movie).to receive(:director).and_return(director)
        allow(movie).to receive(:find_movies_same_director).and_return(movies)
        get :same_director, {:id => id}
        expect(response).to render_template('same_director')
      end
      it 'make the results available to the template' do
        allow(Movie).to receive(:find).with(id).and_return(movie)
        allow(movie).to receive(:director).and_return(director)
        allow(movie).to receive(:find_movies_same_director).and_return(movies)
        get :same_director, {:id => id}
        expect(assigns(:movies)).to eq(movies)
      end
      
    end
    
    
    
    context 'When a movie does not have a director' do
      it 'calls the find method to retrieve a movie' do
        expect(Movie).to receive(:find).with(id3).and_return(movie3)
        allow(movie3).to receive(:director).and_return(nil)
        get :same_director, {:id => id3}
      end
      it 'calls the director getter on the movie' do
        allow(Movie).to receive(:find).with(id3).and_return(movie3)
        expect(movie3).to receive(:director).and_return(nil)
        get :same_director, {:id => id3}
      end
      
      it 'selects the home page template for rendering' do
        allow(Movie).to receive(:find).with(id3).and_return(movie3)
        allow(movie3).to receive(:director).and_return(nil)
        get :same_director, {:id => id3}
        expect(response).to redirect_to(movies_path)
      end
      
      
     
      
    end
  end
  
  describe "destroy" do
    
    let(:movie) {double('movie',:title => 'Alien')}
    let(:id) {'2'}

    it 'calls the find method to retrieve a movie' do
      expect(Movie).to receive(:find).with(id).and_return(movie)
      allow(movie).to receive(:destroy)
      delete :destroy, {:id => id}
    end
    
=begin    
    it 'deletes the same movie' do
      allow(Movie).to receive(:find).with(id).and_return(movie)
      destroy :movie, {:id => id}
        
    end
     it 'displays flash message on home screen' do
      allow(Movie).to receive(:find).with(id).and_return(movie)
      destroy :movie, {:id => id}
      expect(response).to redirect_to(movies_path)
     end
=end
    describe "create" do
      let(:params) {{:title => "Alien"}}
      let(:movie) {double('movie', params)}
      it 'calls the create method to create a new movie' do
        expect(Movie).to receive(:create!).with(params).and_return(movie)
        post :create, {movie: params}  
      end
          
        
        
      
    end
  end
end
