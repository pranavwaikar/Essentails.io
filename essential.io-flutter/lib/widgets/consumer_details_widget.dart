import 'package:essentials/models/service_consumer.dart';
import 'package:essentials/util/user_data.dart';
import 'package:essentials/util/utilities.dart';
import 'package:essentials/widgets/custom_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConsumerDetailsWidget extends StatefulWidget {
  final Function done;

  ConsumerDetailsWidget(this.done);
  @override
  _ConsumerDetailsWidgetState createState() => _ConsumerDetailsWidgetState();
}

class _ConsumerDetailsWidgetState extends State<ConsumerDetailsWidget> {
  final _consumerForm = GlobalKey<FormState>();
  final _houseController = TextEditingController();
  final _landmarkController = TextEditingController();

  final _landmarkFocusNode = FocusNode();

  int area;
  int city;
  int state;

  List<DropdownMenuItem<int>> getAreas() {
    return List.generate(
      Utilities.AREAS.length,
      (i) => DropdownMenuItem(
        value: i,
        child: Text(
          Utilities.AREAS[i],
        ),
      ),
    ).toList();
  }

  List<DropdownMenuItem<int>> getCities() {
    return List.generate(
      Utilities.CITIES.length,
      (i) => DropdownMenuItem(
        value: i,
        child: Text(
          Utilities.CITIES[i],
        ),
      ),
    ).toList();
  }

  List<DropdownMenuItem<int>> getStates() {
    return List.generate(
      Utilities.STATES.length,
      (i) => DropdownMenuItem(
        value: i,
        child: Text(
          Utilities.STATES[i],
        ),
      ),
    ).toList();
  }

  void updateArea(int currentValue) => setState(() {
        area = currentValue;
      });

  void updateCity(int currentValue) => setState(() {
        city = currentValue;
      });

  void updateState(int currentValue) => setState(() {
        state = currentValue;
      });

  @override
  Widget build(BuildContext context) {
    Future<void> _showAlertDialog() async {
      showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(),
      );
    }

    Future<void> _verify() async {
      FocusScope.of(context).requestFocus(FocusNode());
      if (!_consumerForm.currentState.validate()) return;
      if (area == null || city == null || state == null) {
        await _showAlertDialog();
        return;
      }
      UserData.serviceConsumer = ServiceConsumer(
        name: UserData.user.name,
        phone: UserData.user.phone,
        email: UserData.user.email,
        password: UserData.user.password,
        house: _houseController.text,
        landmark: _landmarkController.text,
        area: Utilities.AREAS[area],
        city: Utilities.CITIES[city],
        state: Utilities.STATES[state],
      );
      Navigator.of(context).pop();
    }

    return Form(
      key: _consumerForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            elevation: 5.0,
            margin: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
            color: Colors.blue[50],
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                hintText: 'flat/building/house',
                hintStyle: TextStyle(
                  fontSize: 17.0,
                  letterSpacing: 2.0,
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(
                  Icons.home,
                  size: 30.0,
                  color: Colors.black45,
                ),
                labelText: 'house',
                labelStyle: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 2.0,
                  color: Colors.black26,
                  fontWeight: FontWeight.w400,
                ),
                errorStyle: TextStyle(
                  color: Colors.red[100],
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              style: TextStyle(
                fontSize: 17.0,
                letterSpacing: 2.0,
                color: Colors.grey[900],
                fontWeight: FontWeight.w400,
              ),
              cursorColor: Colors.black,
              controller: _houseController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty)
                  return 'cannot be empty';
                else if (value.length > 50) return 'cannot be greater than 50';
                return null;
              },
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_landmarkFocusNode);
              },
            ),
          ),
          Card(
            elevation: 5.0,
            margin: const EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
            color: Colors.teal[50],
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                hintText: 'near HDFC Bank',
                hintStyle: TextStyle(
                  fontSize: 17.0,
                  letterSpacing: 2.0,
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(
                  Icons.location_on,
                  size: 30.0,
                  color: Colors.black45,
                ),
                labelText: 'landmark',
                labelStyle: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 2.0,
                  color: Colors.black26,
                  fontWeight: FontWeight.w400,
                ),
                errorStyle: TextStyle(
                  color: Colors.red[100],
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              style: TextStyle(
                fontSize: 17.0,
                letterSpacing: 2.0,
                color: Colors.grey[900],
                fontWeight: FontWeight.w400,
              ),
              cursorColor: Colors.black,
              controller: _landmarkController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty)
                  return 'cannot be empty';
                else if (value.length > 20) return 'cannot be greater than 20';
                return null;
              },
              focusNode: _landmarkFocusNode,
              onFieldSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(FocusNode()),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.deepOrange[50],
                margin: const EdgeInsets.only(
                  top: 20.0,
                  left: 20.0,
                ),
                padding: const EdgeInsets.all(11.0),
                child: DropdownButton(
                  isDense: true,
                  itemHeight: 50.0,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black87,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400,
                  ),
                  items: getAreas(),
                  onChanged: (curr) => updateArea(curr),
                  value: area,
                  hint: Text(
                    'area',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3.0,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.deepPurple[50],
                margin: const EdgeInsets.only(
                  top: 20.0,
                  left: 20.0,
                ),
                padding: const EdgeInsets.all(11.0),
                child: DropdownButton(
                  isDense: true,
                  itemHeight: 50.0,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black87,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400,
                  ),
                  items: getCities(),
                  onChanged: (curr) => updateCity(curr),
                  value: city,
                  hint: Text(
                    'city',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3.0,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  color: Colors.brown[50],
                  margin: const EdgeInsets.only(right: 20.0),
                  padding: const EdgeInsets.all(11.0),
                  child: DropdownButton(
                    isDense: true,
                    itemHeight: 50.0,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black87,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w400,
                    ),
                    items: getStates(),
                    onChanged: (curr) => updateState(curr),
                    value: state,
                    hint: Text(
                      'state',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 3.0,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  onPressed: _verify,
                  color: Colors.pink[50],
                  child: Text(
                    'proceed',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 3.0,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
