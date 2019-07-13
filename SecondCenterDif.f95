! HOW TO COMPILE THROUGH COMMAND LINE (CMD OR TERMINAL)
! gfortran -c SecondCenterDif.f95
! gfortran -o SecondCenterDif SecondCenterDif.o
!
! The program is open source and can use to numeric study purpose.
! The program was build by Aulia Khalqillah,S.Si
!
! email: auliakhalqillah.mail@gmail.com
! ==============================================================================
PROGRAM SecondBackwardDifference
  IMPLICIT NONE

  REAL :: A,B,H
  REAL,DIMENSION(1000) :: F,FX,X

  INTEGER :: I,N
  CHARACTER(len=100) :: FMT

  WRITE(*,*)""
  WRITE(*,*)"---------------------------------------------"
  WRITE(*,*)"CENTER DIFFERENCE METHOD - SECOND DERIVATIVE"
  WRITE(*,*)"---------------------------------------------"
  WRITE(*,*) ""
  WRITE(*,"(a)",advance="no") "INSERT INITIAL BOUNDARY:"
  READ *, A
  WRITE(*,"(a)",advance="no") "INSERT FINAL BOUNDARY:"
  READ *, B
  WRITE(*,"(a)",advance="no") "INSERT DATA LENGTH:"
  READ *, N


  FMT = "(a12,a13,a15,a25)"
  WRITE(*,*) ""
  WRITE(*,FMT)"ITER","Data(X)","F(X)","Second Center F(X)"
  OPEN(10, FILE ='SecondCenterOut.txt', STATUS='replace')
  ! Calculating residual between data point
  H = (B-A)/N

  ! Calculating Second Orde Backward Difference
  X(1) = A
  DO I = 1, N+2
    F(I) = X(I)**3
    X(I+1) = X(I) + H
  END DO

  DO I = 1,N
    FX(I) = ((F(I+1) - (2*F(I)) + F(I-1))/(H**2))
  END DO

  DO I = 1,N
    WRITE(*,*) I,X(I),F(I),FX(I)
    WRITE(10,*) I,X(I),F(I),FX(I)
  END DO
  CLOSE(1)

END PROGRAM
