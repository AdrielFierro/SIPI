import { useParams } from "react-router-dom"
import React, { useEffect, useState } from 'react'
import "../estilos/global.css"
import { Link } from "react-router-dom"

const Movie = () => {

    const params = useParams()
    const [movies,setMovies]=useState([])
    const [generos,setGeneros]=useState([])
    const [stringGen,setStringGen]=useState([''])


    

    // fetch(url, options)
      // .then(response => response.json())
      // //.then(response => console.log(response))
      // .then(response =>{setMovies(response)})
      // .catch(err => console.error(err));

      



      useEffect(() => {

const fetchMovie = async () => {
  const url = `https://api.themoviedb.org/3/movie/${params.id}?language=en-US`;
  const options = {
    method: 'GET',
    headers: {
      accept: 'application/json',
      Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YWM5OTZmNTQ4OTIzOTZhMzBlMWMyYjhkYmY1YjZiYSIsInN1YiI6IjYyODA2N2NkY2VlNDgxMDA2NjYyMGJlYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.e2pzE4WfInKObTQxR2DG5-GEZUJmwCyW6NCErHkdo2g'
    }
  };
  try {
    const response = await fetch(url, options);
    const data = await response.json();
    setMovies(data);
  } catch (error) {
    console.error('error:', error);
  }


//  setGeneros( movies.genres)
console.log(movies)
//console.log(generos) 
//const names = movies.genres.map(item => item.name).join(', ');
//console.log(names)
// setStringGen(names)


// const generos2 = data.map(item => item.genres)
// console.log(generos2)




};
fetchMovie();





      }, []);
      

      useEffect(()=>{


      
        
        
        


        




      },[])
      


  return (
    <div>
          <header className='header inicio'>
        <div className='menu'>
            <Link to={"/"} className="btn btn-registrate">Inicio</Link>
            <Link to={"/login"} className="btn btn-inicia-sesion">Iniciar Sesión</Link>
        </div>
        <div className='encabezado inicio'>
            <h2 className='encabezado-h2'>{movies.title}</h2>
            <div className="adorno"></div>
        </div>
    </header>

    <div className="container gap-3">
    <div className="row gap-3 p-4">
    <div className="col-md-3 text-start gap-3">
    <img
              src={`https://image.tmdb.org/t/p/w500${movies.poster_path}`}
              alt={movies.title}
              className="movie-poster"
            />

</div>
<div className="col-md-6">
  <h1 className="text-center">Sinopsis</h1>
  <div className="p-4">{movies.overview}</div>
  <div className="p-4 text-center">{movies.vote_average}</div>
  <h5>Generos: {stringGen}</h5>
  <h5>Fecha de estreno: {movies.release_date}</h5>
  <h5>Pais de origen: {movies.origin_country}</h5>
  
</div>
</div>   
<div className="row">
  <h5>Donde ver</h5>

  </div>
  <div className="row">
  <h5>Actores</h5>

  </div> 
  <div className="row">
  <h5>Comentarios</h5>

  </div>      
    </div>

    </div>
  )
}

export default Movie
