=begin
							Diophantine equation

	Consider quadratic Diophantine equations of the form:

								x² – Dy² = 1

	For example, when D=13, the minimal solution in x is 6492 – 13×1802 = 1.

	It can be assumed that there are no solutions in positive integers when D is
	square.

	By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the
	following:

								3² – 2×2² = 1
								2² – 3×1² = 1
								9² – 5×4² = 1
								5² – 6×2² = 1
								8² – 7×3² = 1

	Hence,  by  considering  minimal  solutions in x for D ≤ 7, the largest x is
	obtained when D=5.

	Find   the value of D ≤ 1000 in minimal solutions of x for which the largest
	value of x is obtained.

	Helped me out:
		*	http://www.kurims.kyoto-u.ac.jp/EMIS/journals/GMN/yahoo_site_admin/assets/docs/1_GMN-8492-V28N2.190180001.pdf
=end

#!/usr/bin/ruby

def diophantine_equation( d )

end

puts diophantine_equation( 7 )