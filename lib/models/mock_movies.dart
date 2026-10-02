import 'package:movie_app/models/movie.dart';

final List<movie> mockPopularMovies = [
  const movie(
    id: '1',
    title: 'Dune: Part Two',
    posterUrl:
        'https://images.unsplash.com/photo-1534447677768-be436bb09401?w=500',
    backdropUrl:
        'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=1000',
    rating: 8.6,
    releaseYear: '2024',
    genres: ['Sci-Fi', 'Adventure'],
    runtime: '2h 46m',
    overview:
        'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.',
  ),

  const movie(
    id: '2',
    title: 'Spider-Man: Across the Spider-Verse',
    posterUrl:
        'https://images.unsplash.com/photo-1607604276583-eef5d076aa5f?w=500',
    backdropUrl:
        'https://images.unsplash.com/photo-1635863138275-d9b33299680b?w=1000',
    rating: 8.7,
    releaseYear: '2023',
    genres: ['Animation', 'Action', 'Sci-Fi'],
    runtime: '2h 20m',
    overview:
        'Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People charged with protecting its very existence.',
  ),
  const movie(
    id: '3',
    title: 'Oppenheimer',
    posterUrl:
        'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=500',
    backdropUrl:
        'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=1000',
    rating: 8.9,
    releaseYear: '2023',
    genres: ['Biography', 'Drama', 'History'],
    runtime: '3h 00m',
    overview:
        'The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb.',
  ),
];

final List<movie> mockTrendingMovies = [
  const movie(
    id: '3',
    title: 'Oppenheimer',
    posterUrl:
        'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=500',
    backdropUrl:
        'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=1000',
    rating: 8.9,
    releaseYear: '2023',
    genres: ['Biography', 'Drama', 'History'],
    runtime: '3h 00m',
    overview:
        'The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb.',
  ),
  const movie(
    id: '4',
    title: 'Interstellar',
    posterUrl:
        'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=500',
    backdropUrl:
        'https://images.unsplash.com/photo-1506703719100-a0f3a48c0f86?w=1000',
    rating: 8.7,
    releaseYear: '2014',
    genres: ['Sci-Fi', 'Drama', 'Adventure'],
    runtime: '2h 49m',
    overview:
        'When Earth becomes uninhabitable, a farmer and ex-NASA pilot is asked to pilot a spacecraft, along with a team of researchers, to find a new planet.',
  ),
  const movie(
    id: '1',
    title: 'Dune: Part Two',
    posterUrl:
        'https://images.unsplash.com/photo-1534447677768-be436bb09401?w=500',
    backdropUrl:
        'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=1000',
    rating: 8.6,
    releaseYear: '2024',
    genres: ['Sci-Fi', 'Adventure'],
    runtime: '2h 46m',
    overview:
        'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.',
  ),
];
