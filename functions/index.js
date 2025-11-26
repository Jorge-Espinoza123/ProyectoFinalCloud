const admin = require("firebase-admin");
const {onCall, HttpsError} = require("firebase-functions/v2/https");

admin.initializeApp();

exports.eliminarUsuario = onCall(async (request) => {
  const uid = request.data.uid;

  if (!uid) {
    throw new HttpsError("invalid-argument", "UID no proporcionado");
  }

  try {
    await admin.auth().deleteUser(uid);
    console.log("Usuario eliminado correctamente:", uid);
    return {
      success: true,
      message: `Usuario ${uid} eliminado`,
    };
  } catch (error) {
    console.error("Error al eliminar usuario:", error);
    throw new HttpsError("internal", "Error al eliminar usuario", {
      error: error.message,
    });
  }
});
