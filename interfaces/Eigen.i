namespace Eigen {
	/*
	%attribute(Matrix, int, cols, cols);
	%attribute(Matrix, int, rows, rows);
	%attribute(Matrix, int, size, size);
	%attribute(Matrix, int, colStride, colStride);
	%attribute(Matrix, int, innerStride, innerStride);
	%attribute(Matrix, int, outerStride, outerStride);
	%attribute(Matrix, int, rowStride, rowStride);
	/* */
	template <class Scalar, int Rows, int Cols, int Options = Eigen::ColMajor>
	class Matrix
	{
// https://eigen.tuxfamily.org/dox/classEigen_1_1Matrix.html
	public:
// Matrix
		~Matrix();
		Matrix();
// PlainObjectBase
		const Scalar & coeff(int rowId, int colId) const;
		/*
		//Scalar* data();
// MatrixBase
		//void adjointInPlace ();
		Scalar determinant() const;
		int diagonalSize () const;
		void normalize();
		void stableNormalize ();
		Scalar trace() const;
// DenseBase
		bool all() const;
		bool allFinite() const;
		bool any() const;
		int count() const;
		void fill(const Scalar& value);
		bool hasNaN() const;
		int innerSize () const;
		Scalar mean() const;
		int nonZeros() const;
		int outerSize () const;
		Scalar prod() const;
		void reverseInPlace ();
		Scalar sum() const;
		//void transposeInPlace ();
// DenseCoeffsBase
		int colStride() const;
		int innerStride() const;
		int outerStride() const;
		int rowStride() const;
		/* */
// EigenBase
		int cols() const;
		int rows() const;
		int size() const;
	};
	
	typedef Matrix<float, 3, 1> Vector3f;
	
	template <class Scalar, int Dim, int Mode, int Options>
	class Transform
	{
// https://eigen.tuxfamily.org/dox/classEigen_1_1Transform.html
	public:
		~Transform ();
		Transform ();
		static const Transform Identity ();
		const Matrix<Scalar, Dim, Dim, Options> rotation () const;
		const Matrix<Scalar, Dim, 1> translation () const;
		/*
		void setIdentity ();
		void makeAffine ();
		Transform & prescale (const Scalar &s);
		Transform & scale (const Scalar &s);
		//TranslationPart translation ();
		/* */
	};
	
	%attributeref(Translation, Scalar, x);
	%attributeref(Translation, Scalar, y);
	%attributeref(Translation, Scalar, z);
	template <class Scalar, int Dim>
	class Translation
	{
// https://eigen.tuxfamily.org/dox/classEigen_1_1Translation.html
	public:
		~Translation ();
		Translation ();
		//Translation (const VectorType &vector);
		//Translation<Scalar, Dim> inverse () const;
		//Scalar x () const;
		Scalar & x ();
		//Scalar y () const;
		Scalar & y ();
		//Scalar z () const;
		Scalar & z ();
	};
	
	%attributeref(Quaternion, Scalar, w);
	%attributeref(Quaternion, Scalar, x);
	%attributeref(Quaternion, Scalar, y);
	%attributeref(Quaternion, Scalar, z);
	template <class Scalar>
	class Quaternion
	{
// https://eigen.tuxfamily.org/dox/classEigen_1_1Quaternion.html
	public:
// Quaternion
		~Quaternion();
		Quaternion ();
		Quaternion (const Scalar &w, const Scalar &x, const Scalar &y, const Scalar &z);
		Scalar& w();
		Scalar& x();
		Scalar& y();
		Scalar& z();
		/*
		//static Quaternion<Scalar> UnitRandom ();
		Quaternion<Scalar> conjugate () const;
		Quaternion<Scalar> inverse () const;
		Scalar norm () const;
		void normalize ();
		Quaternion<Scalar> normalized () const;
		Scalar squaredNorm () const;
		//Matrix3 toRotationMatrix () const;
// RotationBase
		//RotationMatrixType matrix () const;
		/* */
	};
}
