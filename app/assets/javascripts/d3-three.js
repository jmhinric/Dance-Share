(function(){
  var VIZ ={};
  var camera, renderer, controls, scene = new THREE.Scene();
  var width = window.innerWidth, height = window.innerHeight;

  camera = new THREE.PerspectiveCamera(40, width/height , 1, 10000);
  camera.position.z = 3000;
  camera.setLens(30);
  
  VIZ.drawElements = function (data) {

    VIZ.count = data.length;

    var margin = {top: 17, right: 0, bottom: 16, left: 20},
        width  = 225 - margin.left - margin.right,
        height = 140 - margin.top  - margin.bottom;

    var elements = d3.selectAll('.element')
        .data(data).enter()
        .append('div')
        .attr('class', 'element')
        .on('click', function(d) {
            display_video(d);
        });

    elements.append('div')
      .attr('class', 'chartTitle')
      .html(function (d) { return d.name; });

    elements.append('img')
      .attr('class', 'customImage')
      .attr('src', function(d) { return d.image; })
      .attr('width', width)
      .attr('height', height);

    elements.each(setData);
    elements.each(objectify);
  };

  function display_video(d) {
    var closeButton = $('<span>')
      .addClass('close-video')
      .text('X')
      .on('click', function() {
        $('.video-player-wrapper').remove();
      });

    var closeVideo = $('<div>')
      .append(closeButton);

    var player = $('<div>')
      .addClass('video-player')
      .append(closeVideo)
      .append(d.video);
    $('<div>').addClass('video-player-wrapper')
      .append(player)
      .appendTo('#container');
  }

  function objectify(d) {
    var object = new THREE.CSS3DObject(this);
    object.position = d.random.position;
    scene.add(object);
  }

  function setData(d, i) {
    var vector, phi, theta;

    var random = new THREE.Object3D();
    random.position.x = Math.random() * 4000 - 2000;
    random.position.y = Math.random() * 4000 - 2000;
    random.position.z = Math.random() * 4000 - 2000;
    d['random'] = random;

    var sphere = new THREE.Object3D();
    vector = new THREE.Vector3();
    phi = Math.acos(-1 + ( 2 * i ) / (VIZ.count - 1));
    theta = Math.sqrt((VIZ.count - 1) * Math.PI) * phi;
    sphere.position.x = 800 * Math.cos(theta) * Math.sin(phi);
    sphere.position.y = 800 * Math.sin(theta) * Math.sin(phi);
    sphere.position.z = 800 * Math.cos(phi);
    vector.copy(sphere.position).multiplyScalar(2);
    sphere.lookAt(vector);
    d['sphere'] = sphere;

    var helix = new THREE.Object3D();
    vector = new THREE.Vector3();
    phi = (i + 12) * 0.250 + Math.PI;
    helix.position.x = 1000 * Math.sin(phi);
    helix.position.y = - (i * 8) + 500;
    helix.position.z = 1000 * Math.cos(phi);
    vector.x = helix.position.x * 2;
    vector.y = helix.position.y;
    vector.z = helix.position.z * 2;
    helix.lookAt(vector);
    d['helix'] = helix;

    var grid = new THREE.Object3D();
    grid.position.x = (( i % 5 ) * 400) - 800;
    grid.position.y = ( - ( Math.floor( i / 5 ) % 5 ) * 400 ) + 800;
    grid.position.z = (Math.floor( i / 25 )) * 1000 - 2000;
    d['grid'] = grid;


  }

  VIZ.render = function () {
    renderer.render(scene, camera);
  };

  d3.select("#menu").selectAll('button')
    .data(['sphere', 'helix', 'grid']).enter()
      .append('button')
      .attr('class', 'd3Button')
      .html(function (d) { return d; })
      .on('click', function (d) { VIZ.transform(d); });

  VIZ.transform = function (layout) {
    var duration = 1000;

    TWEEN.removeAll();

    scene.children.forEach(function (object){
      var newPos = object.element.__data__[layout].position;
      var coords = new TWEEN.Tween(object.position)
            .to({x: newPos.x, y: newPos.y, z: newPos.z}, duration)
            .easing(TWEEN.Easing.Sinusoidal.InOut)
            .start();

      var newRot = object.element.__data__[layout].rotation;
      var rotate = new TWEEN.Tween(object.rotation)
            .to({x: newRot.x, y: newRot.y, z: newRot.z}, duration)
            .easing(TWEEN.Easing.Sinusoidal.InOut)
            .start();
    });
    
   var update = new TWEEN.Tween(this)
       .to({}, duration)
       .onUpdate(VIZ.render)
       .start();
  };

  VIZ.animate = function () {
    requestAnimationFrame(VIZ.animate);
    TWEEN.update();
    controls.update();
  };

  renderer = new THREE.CSS3DRenderer();
  renderer.setSize(width, height);
  renderer.domElement.style.position = 'absolute';
  document.getElementById('container').appendChild(renderer.domElement);
  var backHeight = $(document).height().toString() + "px";
  d3.select('#d3-three').style({'height': backHeight});

  controls = new THREE.TrackballControls(camera, renderer.domElement);
  controls.rotateSpeed = 0.5;
  controls.minDistance = 100;
  controls.maxDistance = 6000;
  controls.addEventListener('change', VIZ.render);

  VIZ.onWindowResize = function () {
    camera.aspect = width / height;
    camera.updateProjectionMatrix();
    renderer.setSize(window.innerWidth, window.innerHeight);
    VIZ.render();
  };
  window.VIZ = VIZ;
}());