import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  static const Color _mainBrandBlue = Color(0xFF1E88E5);
  static const Color _darkNavy = Color(0xFF001533);
  static const Color _lightGrey = Color(0xFF9E9E9E);
  static const Color _softGreyBorder = Color(0xFFE0E0E0);

  InputDecoration _buildInputDecoration({
    required Widget prefixIcon,
    String? hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: _lightGrey, fontSize: 14),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12),
        child: prefixIcon,
      ),
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _softGreyBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _softGreyBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _mainBrandBlue, width: 2),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }

  Future<void> _loginWithEmail() async {
    Navigator.pushReplacementNamed(context, '/home');
  }

  Future<void> _loginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/imagenes/fondoLogin.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/imagenes/logo.png',
                                  height: 140,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 40),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 32),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: _darkNavy.withValues(alpha: 0.8),
                                      ),
                                      children: const [
                                        TextSpan(text: 'Encontrá tu próxima '),
                                        TextSpan(
                                          text: 'carrera',
                                          style: TextStyle(
                                            color: _mainBrandBlue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: ' y guardá tus favoritos'),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40, left: 24, right: 24, bottom: 24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: _buildInputDecoration(
                                      prefixIcon: Image.asset(
                                        'assets/imagenes/logoCorreo.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                      hintText: 'Correo electrónico',
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: _obscurePassword,
                                    decoration: _buildInputDecoration(
                                      prefixIcon: Image.asset(
                                        'assets/imagenes/logoContra.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                      hintText: 'Contraseña',
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _obscurePassword = !_obscurePassword;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Image.asset(
                                            'assets/imagenes/iconoOjo.png',
                                            width: 24,
                                            height: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        '¿Olvidaste tu contraseña?',
                                        style: TextStyle(
                                          color: _mainBrandBlue,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: _loginWithEmail,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _mainBrandBlue,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 2,
                                    ),
                                    child: const Text(
                                      'INICIAR SESIÓN',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    children: [
                                      const Expanded(child: Divider(color: _softGreyBorder)),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        child: Text(
                                          'o continuá con',
                                          style: TextStyle(
                                            color: _lightGrey,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      const Expanded(child: Divider(color: _softGreyBorder)),
                                    ],
                                  ),
                                  const SizedBox(height: 24),
                                  OutlinedButton(
                                    onPressed: _loginWithGoogle,
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: _darkNavy,
                                      padding: const EdgeInsets.symmetric(vertical: 14),
                                      side: const BorderSide(color: _softGreyBorder),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: AssetImage('assets/imagenes/logoGoogle.png'),
                                          height: 24,
                                        ),
                                        SizedBox(width: 12),
                                        Text(
                                          'Continuar con Google',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        '¿No tenés cuenta? ',
                                        style: TextStyle(
                                          color: _lightGrey,
                                          fontSize: 14,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: const Text(
                                          'Registrate',
                                          style: TextStyle(
                                            color: _mainBrandBlue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}