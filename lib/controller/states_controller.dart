import 'package:aqueduct/aqueduct.dart';
import 'package:states/states.dart';

class StatesController extends ResourceController{
  final _states = [
    
    {'uf': 'AC', 'Nome': 'Acre'},
    {'uf':'AL', 'Nome': 'Alagoas'},
    {'uf':'AP', 'Nome': 'Amapá'},
    {'uf':'AM', 'Nome': 'Amazonas'},
    {'uf':'BA', 'Nome':'Bahia'},
    {'uf':'CE', 'Nome':'Ceará'},
    {'uf':'DF', 'Nome':'Distrito Federal'},
    {'uf':'ES', 'Nome':'Espírito Santo'},
    {'uf':'GO', 'Nome':'Goiás'},
    {'uf':'MA', 'Nome':'Maranhão'},
    {'uf':'MT', 'Nome':'Mato Grosso'},
    {'uf':'MS', 'Nome':'Mato Grosso do Sul'},
    {'uf':'MG', 'Nome':'Minas Gerais'},
    {'uf':'PA', 'Nome':'Pará'},
    {'uf':'PB', 'Nome':'Paraíba'},
    {'uf':'PR', 'Nome':'Paraná'},
    {'uf':'PE', 'Nome':'Pernambuco'},
    {'uf':'PI', 'Nome':'Piauí'},
    {'uf':'RJ', 'Nome':'Rio de Janeiro'},
    {'uf':'RN', 'Nome':'Rio Grande do Norte'},
    {'uf':'RS', 'Nome':'Rio Grande do Sul'},
    {'uf':'RO', 'Nome':'Rondônia'},
    {'uf':'RR', 'Nome':'Roraima'},
    {'uf':'SC', 'Nome':'Santa Catarina'},
    {'uf':'SP', 'Nome':'São Paulo'},
    {'uf':'SE', 'Nome':'Sergipe'},
    {'uf':'TO', 'Nome':'Tocantins'},
  ];

  @Operation.get()
  Future<Response> getAllStates() async{
    return Response.ok(_states);
  }

  @Operation.get('uf')
  Future<Response> getStateByUf() async{
    final uf = request.path.variables['uf'];
    final state = _states.firstWhere((state) => state['uf'] == uf.toUpperCase(), orElse: () => null);

    return Response.ok(state ?? []);

  }
}