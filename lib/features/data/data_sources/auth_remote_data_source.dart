
import 'package:firebase_auth/firebase_auth.dart';


abstract class AuthRemoteDataSource {
  Future<bool> signIn({required String email,required String password});
  Future<bool> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  @override
  Future<bool> signIn({required String email,required String password}) async {
    final dataList = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return true;
  }

  @override
  Future<bool> signOut() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    return auth.currentUser==null;
  }
}
