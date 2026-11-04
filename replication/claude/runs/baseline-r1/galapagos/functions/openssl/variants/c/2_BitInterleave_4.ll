; ModuleID = '/home/liolsen/galapagos-replication/functions/openssl/variants/c/2_BitInterleave_4.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/openssl/variants/c/2_BitInterleave_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i64 @BitInterleave(i64 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @BitInterleave(i64 noundef %Ai) #0 {
entry:
  %Ai.addr = alloca i64, align 8
  %x = alloca i64, align 8
  %e = alloca i64, align 8
  %o = alloca i64, align 8
  store i64 %Ai, ptr %Ai.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  br i1 false, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %0 = load i64, ptr %Ai.addr, align 8
  store i64 %0, ptr %x, align 8
  %1 = load i64, ptr %x, align 8
  %and = and i64 %1, 6148914691236517205
  store i64 %and, ptr %e, align 8
  %2 = load i64, ptr %x, align 8
  %shr = lshr i64 %2, 1
  %and1 = and i64 %shr, 6148914691236517205
  store i64 %and1, ptr %o, align 8
  %3 = load i64, ptr %e, align 8
  %4 = load i64, ptr %e, align 8
  %shr2 = lshr i64 %4, 1
  %or = or i64 %3, %shr2
  %and3 = and i64 %or, 3689348814741910323
  store i64 %and3, ptr %e, align 8
  %5 = load i64, ptr %e, align 8
  %6 = load i64, ptr %e, align 8
  %shr4 = lshr i64 %6, 2
  %or5 = or i64 %5, %shr4
  %and6 = and i64 %or5, 1085102592571150095
  store i64 %and6, ptr %e, align 8
  %7 = load i64, ptr %e, align 8
  %8 = load i64, ptr %e, align 8
  %shr7 = lshr i64 %8, 4
  %or8 = or i64 %7, %shr7
  %and9 = and i64 %or8, 71777214294589695
  store i64 %and9, ptr %e, align 8
  %9 = load i64, ptr %e, align 8
  %10 = load i64, ptr %e, align 8
  %shr10 = lshr i64 %10, 8
  %or11 = or i64 %9, %shr10
  %and12 = and i64 %or11, 281470681808895
  store i64 %and12, ptr %e, align 8
  %11 = load i64, ptr %o, align 8
  %12 = load i64, ptr %o, align 8
  %shr13 = lshr i64 %12, 1
  %or14 = or i64 %11, %shr13
  %and15 = and i64 %or14, 3689348814741910323
  store i64 %and15, ptr %o, align 8
  %13 = load i64, ptr %o, align 8
  %14 = load i64, ptr %o, align 8
  %shr16 = lshr i64 %14, 2
  %or17 = or i64 %13, %shr16
  %and18 = and i64 %or17, 1085102592571150095
  store i64 %and18, ptr %o, align 8
  %15 = load i64, ptr %o, align 8
  %16 = load i64, ptr %o, align 8
  %shr19 = lshr i64 %16, 4
  %or20 = or i64 %15, %shr19
  %and21 = and i64 %or20, 71777214294589695
  store i64 %and21, ptr %o, align 8
  %17 = load i64, ptr %o, align 8
  %18 = load i64, ptr %o, align 8
  %shr22 = lshr i64 %18, 8
  %or23 = or i64 %17, %shr22
  %and24 = and i64 %or23, 281470681808895
  store i64 %and24, ptr %o, align 8
  %19 = load i64, ptr %e, align 8
  %and25 = and i64 %19, 65535
  %20 = load i64, ptr %e, align 8
  %shr26 = lshr i64 %20, 16
  %and27 = and i64 %shr26, 4294901760
  %or28 = or i64 %and25, %and27
  %21 = load i64, ptr %o, align 8
  %and29 = and i64 %21, 65535
  %shl = shl i64 %and29, 32
  %or30 = or i64 %or28, %shl
  %22 = load i64, ptr %o, align 8
  %shr31 = lshr i64 %22, 16
  %shl32 = shl i64 %shr31, 48
  %or33 = or i64 %or30, %shl32
  store i64 %or33, ptr %Ai.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %23 = load i64, ptr %Ai.addr, align 8
  ret i64 %23
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
