import 'package:flare_flutter/asset_provider.dart';
import 'package:flare_flutter/base/actor.dart';
import 'package:flare_flutter/base/actor_artboard.dart';
import 'package:flare_flutter/base/actor_axis_constraint.dart';
import 'package:flare_flutter/base/actor_blur.dart';
import 'package:flare_flutter/base/actor_bone.dart';
import 'package:flare_flutter/base/actor_bone_base.dart';
import 'package:flare_flutter/base/actor_color.dart';
import 'package:flare_flutter/base/actor_component.dart';
import 'package:flare_flutter/base/actor_constraint.dart';
import 'package:flare_flutter/base/actor_distance_constraint.dart';
import 'package:flare_flutter/base/actor_drawable.dart';
import 'package:flare_flutter/base/actor_drop_shadow.dart';
import 'package:flare_flutter/base/actor_ellipse.dart';
import 'package:flare_flutter/base/actor_event.dart';
import 'package:flare_flutter/base/actor_flags.dart';
import 'package:flare_flutter/base/actor_ik_constraint.dart';
import 'package:flare_flutter/base/actor_image.dart';
import 'package:flare_flutter/base/actor_inner_shadow.dart';
import 'package:flare_flutter/base/actor_jelly_bone.dart';
import 'package:flare_flutter/base/actor_layer_effect.dart';
import 'package:flare_flutter/base/actor_layer_effect_renderer.dart';
import 'package:flare_flutter/base/actor_mask.dart';
import 'package:flare_flutter/base/actor_node.dart';
import 'package:flare_flutter/base/actor_node_solo.dart';
import 'package:flare_flutter/base/actor_path.dart';
import 'package:flare_flutter/base/actor_polygon.dart';
import 'package:flare_flutter/base/actor_rectangle.dart';
import 'package:flare_flutter/base/actor_root_bone.dart';
import 'package:flare_flutter/base/actor_rotation_constraint.dart';
import 'package:flare_flutter/base/actor_scale_constraint.dart';
import 'package:flare_flutter/base/actor_shadow.dart';
import 'package:flare_flutter/base/actor_shape.dart';
import 'package:flare_flutter/base/actor_skin.dart';
import 'package:flare_flutter/base/actor_skinnable.dart';
import 'package:flare_flutter/base/actor_star.dart';
import 'package:flare_flutter/base/actor_targeted_constraint.dart';
import 'package:flare_flutter/base/actor_transform_constraint.dart';
import 'package:flare_flutter/base/actor_translation_constraint.dart';
import 'package:flare_flutter/base/actor_triangle.dart';
import 'package:flare_flutter/base/animation/actor_animation.dart';
import 'package:flare_flutter/base/animation/interpolation/cubic.dart';
import 'package:flare_flutter/base/animation/interpolation/cubic_ease.dart';
import 'package:flare_flutter/base/animation/interpolation/hold.dart';
import 'package:flare_flutter/base/animation/interpolation/interpolator.dart';
import 'package:flare_flutter/base/animation/interpolation/linear.dart';
import 'package:flare_flutter/base/animation/keyframe.dart';
import 'package:flare_flutter/base/animation/property_types.dart';
import 'package:flare_flutter/base/binary_reader.dart';
import 'package:flare_flutter/base/block_reader.dart';
import 'package:flare_flutter/base/block_types.dart';
import 'package:flare_flutter/base/dependency_sorter.dart';
import 'package:flare_flutter/base/jelly_component.dart';
import 'package:flare_flutter/base/json_block_reader.dart';
import 'package:flare_flutter/base/json_reader.dart';
import 'package:flare_flutter/base/math/aabb.dart';
import 'package:flare_flutter/base/math/mat2d.dart';
import 'package:flare_flutter/base/math/transform_components.dart';
import 'package:flare_flutter/base/math/vec2d.dart';
import 'package:flare_flutter/base/path_point.dart';
import 'package:flare_flutter/base/stream_reader.dart';
import 'package:flare_flutter/base/transform_space.dart';
import 'package:flare_flutter/cache.dart';
import 'package:flare_flutter/cache_asset.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flare_flutter/flare_cache_asset.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flare_flutter/flare_render_box.dart';
import 'package:flare_flutter/flare_testing.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flare_flutter/provider/memory_flare.dart';
import 'package:flare_flutter/trim_path.dart';
import 'package:flutter/material.dart';

import 'model/number.dart';
import 'model/rectangle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _widthController = new TextEditingController();


  var _randomicNumber;
  double _perimeter;
  double _area;

  _rowHeight(BuildContext context) {
    return new TextFormField(
      controller: _heightController,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        hintText: "Digite a altura",
      ),
    );
  }

  _rowWidth(BuildContext context) {
    return new TextFormField(
      controller: _widthController,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        hintText: "Digite a largura",
      ),
    );
  }
  _rowButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        _register(context);
        _resetFields();
      },
      label: Text('Calcular a aréa e o perimetro do Retangulo'),
      icon: Icon(Icons.add),
    );
  }



  _rowFlare() {
    return Column(
      children: [
        Center(
          child: Container(
            child: FlareActor(
              'assets/WorldSpin.flr',
              fit: BoxFit.contain,
              animation: 'roll',
            ),
            width: 400,
            height: 400,
          ),
        ),
        Text('Created by:\n Nicholas Goes - nicholasfernandesdegoes@gmail.com\nLuiz Eduardo - luizeduardolopescandido@gmail.com', textAlign: TextAlign.center, style: TextStyle(fontSize: 15.0, color: Colors.pink),),
      ]);
  }

  _rowRandomic() {
    return Column(
      children: [
        Text('Randomic Number:', textAlign: TextAlign.center, style: TextStyle(fontSize: 50.0, color: Colors.pink),),
        Text('$_randomicNumber', style: TextStyle(fontSize: 50.0, color: Colors.pink),),
        FloatingActionButton(onPressed: () => _generateNumber(), tooltip: 'Randomic number',
          child: Icon(Icons.auto_awesome),
        ),
      ],
    );
  }

  _formUI(BuildContext context) {
    return Column(
      children: [
        _rowHeight(context),
        _rowWidth(context),
        _rowButton(context),
        _rowResults(),
      ],
    );
  }

  _rowForm(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: _formUI(context),
    );
  }

  _rowResults(){
    return Row(
      children: [
        Text('A area do Retangulo $_area\nO perimetro do retangulo é: $_perimeter', style: TextStyle(fontSize: 20.0),),
      ],
    );
  }

  void _generateNumber() {
    setState(() {
      _randomicNumber = Number.generateRandomicNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App da Prova',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.vpn_lock_rounded)),
                Tab(icon: Icon(Icons.auto_awesome)),
                Tab(icon: Icon(Icons.web_asset_sharp)),
              ],
            ),
            title: Text('Prova - Flutter'),
          ),
          body: TabBarView(
            children: [
              Container(
                child: _rowFlare(),
              ),
              Container(
                child: _rowRandomic(),
              ),
              Container(
                child: _rowForm(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _register(BuildContext context) {
    print('validate ${_formKey.currentState.validate()}');

    if (_formKey.currentState.validate()) {
      final rectangle = Rectangle(
        double.tryParse(_heightController.text),
        double.tryParse(_widthController.text),
      );

      setState(() {
        _area = rectangle.calculateArea();
        _perimeter = rectangle.calculatePerimeter();
      });
    }
  }
  _resetFields() => _formKey.currentState.reset();
}

