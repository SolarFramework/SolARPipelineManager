%define EIGEN(NAME, TYPE...)
%shared_ptr(Eigen::TYPE)
%template(NAME) Eigen::TYPE;
%enddef

EIGEN(Matrix2x2f, Matrix<float, 2, 2, Eigen::RowMajor>)
EIGEN(Matrix3x3f, Matrix<float, 3, 3, Eigen::RowMajor>)


%define DATASTRUCT(NAME, TYPE...)
%template(NAME##_) SolAR::datastructure::TYPE;
%enddef

%define VECTOR(NAME, SIZE, TYPE)
EIGEN(NAME, Matrix<TYPE, SIZE, 1>)
DATASTRUCT(NAME, Vector<TYPE, SIZE>)
%enddef

VECTOR(Vector2f, 2, float)
VECTOR(Vector3f, 3, float)
VECTOR(Vector5f, 5, float)

VECTOR(Vector2i, 2, int)
VECTOR(Vector3i, 3, int)

%define TRANSFORM(NAME, SIZE, TYPE)
EIGEN(NAME, Transform<TYPE, SIZE, Eigen::Projective, Eigen::RowMajor>)
DATASTRUCT(NAME, Transform<TYPE, SIZE, Eigen::Projective, Eigen::RowMajor>)
%enddef

TRANSFORM(Transform2Df, 2, float)
TRANSFORM(Transform3Df, 3, float)
