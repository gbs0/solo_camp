const instance = new Grid({
    el: document.getElementById('grid'), // Container element
    columns: [
      {
        header: 'Name',
        name: 'name'
      },
      {
        header: 'Artist',
        name: 'artist'
      },
      {
        header: 'Release',
        name: 'release'
      },
      {
        header: 'Genre',
        name: 'genre'
      }
    ],
    data: [
      {
        name: 'Beautiful Lies',
        artist: 'Birdy',
        release: '2016.03.26',
        genre: 'Pop'
      }
    ]
  });
  
//   instance.resetData(newData); // Call API of instance's public method
  
instance.applyTheme('striped'); // Call API of static method