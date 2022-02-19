import 'package:dashboard_camera_trap/core/router/routes_name.dart';
import 'package:dashboard_camera_trap/domain/entities/user.dart';
import 'package:dashboard_camera_trap/providers/general_providers.dart';
import 'package:dashboard_camera_trap/providers/user/google_auth.dart';
import 'package:dashboard_camera_trap/ui/shared/logo.dart';
import 'package:dashboard_camera_trap/ui/shared/separator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  Future<void> _handleSignIn() async {
    try {
      GoogleSignInAccount? account = await ref.read(googleSignIn).signIn();
      User user = User(id: account!.id, name: account.displayName, email: account.email, photo: account.photoUrl);
      ref.read(userProvider.notifier).saveCurrentUser(user);
      Navigator.pushNamed(context, RoutesName.HOME_PAGE);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        _buildBackgroundImage(),
        _buildLoginCircle(context),
      ],
    ));
  }

  Widget _buildLoginCircle(BuildContext context) {
    return Positioned(
      left: 200,
      top: 0,
      bottom: 0,
      child: Center(
        child: Container(
          width: 300,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoWidget(),
              const SeparatorWidget(vertical: 30),
              _buildGoogleSignIn(context),
            ],
          ),
        ),
      ),
    );
  }

  Image _buildBackgroundImage() {
    return Image.network(
      "https://images.unsplash.com/photo-1634521991558-a1f4dbd641db?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      fit: BoxFit.cover,
      alignment: Alignment.centerLeft,
    );
  }

  Widget _buildGoogleSignIn(BuildContext context) => ElevatedButton.icon(
        onPressed: () => _handleSignIn(),
        label: Text(
          "INICIAR SESIÓN\nCON GOOGLE",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        icon: const Icon(Icons.login),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
          backgroundColor: MaterialStateProperty.all(Colors.red),
          elevation: MaterialStateProperty.all(0),
        ),
      );
}

// class LoginPage extends StatefulWidget {

//   @override
//   State createState() => LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {
//   final List<drive.File> _documents = [];

//   @override
//   void initState() {
//     super.initState();
//     _signIn();
//   }

  
  

//   // void _getDocuments() async {
//   //   final client = http.Client();
//   //   var header = await _currentUser!.authHeaders;
//   //   var authClient = AuthClient(client, header);
//   //   var api = drive.DriveApi(authClient);

//   //   String? pageToken;
//   //   _documents.clear();
//   //   do {
//   //     drive.FileList fileList = await api.files.list(
//   //         q: "modifiedTime > '2021-12-12T12:00:00'",
//   //         pageSize: 20,
//   //         pageToken: pageToken,
//   //         supportsAllDrives: false,
//   //         spaces: "drive",
//   //         $fields: "nextPageToken, files(id, name, mimeType, thumbnailLink)");
//   //     pageToken = fileList.nextPageToken;

//   //     for (File file in fileList.files!) {
//   //       print("Found file: %s (%s)\n ${file.name!} ${file.id!}");
//   //     }
//   //     _documents.addAll(fileList.files!);
//   //     print("Documents: $_documents");
//   //   } while (pageToken != null);

//   //   setState(() {});
//   // }


//   Widget _buildBody() {
//     GoogleSignInAccount? user = _currentUser;
//     if (user != null) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           ListTile(
//             leading: GoogleUserCircleAvatar(
//               identity: user,
//             ),
//             title: Text(user.displayName ?? ''),
//             subtitle: Text(user.email),
//           ),
//           const Text("Signed in successfully."),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _documents.length,
//               itemBuilder: (context, index) {
//                 var file = _documents[index];
//                 return _buildItem(file);
//               },
//             ),
//           ),
//           ElevatedButton(
//             child: const Text('SIGN OUT'),
//             onPressed: _handleSignOut,
//           ),
//         ],
//       );
//     } else {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           const Text("You are not currently signed in."),
//           ElevatedButton(
//             child: const Text('SIGN IN'),
//             onPressed: _handleSignIn,
//           ),
//         ],
//       );
//     }
//   }

//   Widget _buildItem(File file) {
//     if (file.thumbnailLink != null && file.mimeType!.contains("image")) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 width: double.infinity,
//                 child: Image.network(
//                   file.thumbnailLink!,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(file.name!),
//               )
//             ],
//           ),
//         ),
//       );
//     } else {
//       Widget? leadingIcon;
//       if (file.mimeType!.contains("folder")) {
//         leadingIcon = const Icon(Icons.folder);
//       }

//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           child: ListTile(
//             leading: leadingIcon,
//             title: Text(file.name!),
//             subtitle: Text(file.mimeType!),
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Google Sign In'),
//         ),
//         body: ConstrainedBox(
//           constraints: const BoxConstraints.expand(),
//           child: _buildBody(),
//         ));
//   }
// }

// class AuthClient extends http.BaseClient {
//   final http.Client _baseClient;
//   final Map<String, String> _headers;

//   AuthClient(this._baseClient, this._headers);

//   @override
//   Future<http.StreamedResponse> send(http.BaseRequest request) {
//     request.headers.addAll(_headers);
//     return _baseClient.send(request);
//   }
// }
