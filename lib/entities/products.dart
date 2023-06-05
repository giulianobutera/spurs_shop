class Product {
  final String image, title, description;
  final int price, id;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: 'Buzo Corazón Spurs',
      price: 14000,
      image: 'assets/images/buzoCorazonSpurs.png',
      description:
          'Manténgase cómodo en las gradas con el buzo con capucha con estampado de purpurina Corazón Spurs. ¡Una excelente manera de mostrarle a su equipo su apoyo!.'),
  Product(
      id: 2,
      title: 'Buzo Nike Entrenamiento Mujeres',
      price: 19400,
      image: 'assets/images/buzoNikeEntrenamientoMujeres.png',
      description:
          'Mejora tu rutina de entrenamiento con el buzo Nike Drill de los Spurs para mujer 2022/23. Este diseño combina tela absorbente de humedad con ingeniería avanzada.'),
  Product(
      id: 3,
      title: 'Buzo Nike Travel',
      price: 17800,
      image: 'assets/images/buzoNikeTravel.png',
      description:
          'Mantén las cosas informales con el buzo Nike Travel de los Spurs. Confeccionada con una acogedora mezcla de algodón, este buzo con capucha te mantendrá abrigado en los días de partido más fríos en las gradas.'),
  Product(
      id: 4,
      title: 'Campera Nike AWF Mujeres',
      price: 20500,
      image: 'assets/images/camperaNikeAWFMujeres.png',
      description:
          'La campera Nike AWF para mujer de los Spurs 2022/23 hace que el sudor se evapore rápidamente garantizando que te mantengas seca y cómoda sin importar lo duro que entrenes.'),
  Product(
      id: 5,
      title: 'Campera Nike Fleece',
      price: 21000,
      image: 'assets/images/camperaNikeFleece.png',
      description:
          'Mantente fresco y cómodo sin importar el clima con la campera con capucha Nike Fleece Spurs 2022/23. Utilizando la innovadora tecnología de tejido Dri-FIT de Nike, esta práctica sudadera con capucha aleja el sudor de la piel para una evaporación más rápida.'),
  Product(
      id: 6,
      title: 'Campera Nike Hooded',
      price: 23800,
      image: 'assets/images/camperaNikeHooded.png',
      description:
          'Confeccionada con fibras de poliéster 100% recicladas, esta campera combina un tejido que repele la humedad con un diseño elegante que ayuda a mantenerte fresco cuando el entrenamiento aumenta.'),
  Product(
      id: 7,
      title: 'Remera Spurs 1882',
      price: 9000,
      image: 'assets/images/remeraSpurs1882.png',
      description:
          'Que todos sepan que los Spurs son el único equipo que apoyas con la camiseta estampada Spurs 1882. Hecha de 100% algodón.'),
  Product(
      id: 8,
      title: 'Remera Tercer Kit Tottenham 22/23',
      price: 35500,
      image: 'assets/images/remeraTercerKitTottenham2223.png',
      description:
          'El estilo se combina con el rendimiento en la tercera equipación de esta temporada. Ajuste excepcional y tecnología de tejido innovadora hacen de esta camiseta una pieza destacada para cualquier aficionado.'),
];
