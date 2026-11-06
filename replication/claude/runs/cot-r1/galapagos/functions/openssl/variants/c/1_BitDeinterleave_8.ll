; ModuleID = '/home/liolsen/galapagos-replication/functions/openssl/variants/c/1_BitDeinterleave_8.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/openssl/variants/c/1_BitDeinterleave_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i64 @BitDeinterleave(i64 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @BitDeinterleave(i64 noundef %Ai) #0 {
entry:
  %Ai.addr = alloca i64, align 8
  %k = alloca i32, align 4
  %x = alloca i64, align 8
  store i64 %Ai, ptr %Ai.addr, align 8
  %0 = load i64, ptr %Ai.addr, align 8
  store i64 %0, ptr %x, align 8
  store i32 0, ptr %k, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %k, align 4
  %cmp = icmp slt i32 %1, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i64, ptr %x, align 8
  %shr = lshr i64 %2, 1
  %and = and i64 %shr, 6148914691236517205
  %3 = load i64, ptr %x, align 8
  %and1 = and i64 %3, 6148914691236517205
  %shl = shl i64 %and1, 1
  %or = or i64 %and, %shl
  store i64 %or, ptr %x, align 8
  %4 = load i64, ptr %x, align 8
  %shr2 = lshr i64 %4, 2
  %and3 = and i64 %shr2, 3689348814741910323
  %5 = load i64, ptr %x, align 8
  %and4 = and i64 %5, 3689348814741910323
  %shl5 = shl i64 %and4, 2
  %or6 = or i64 %and3, %shl5
  store i64 %or6, ptr %x, align 8
  %6 = load i64, ptr %x, align 8
  %shr7 = lshr i64 %6, 4
  %and8 = and i64 %shr7, 1085102592571150095
  %7 = load i64, ptr %x, align 8
  %and9 = and i64 %7, 1085102592571150095
  %shl10 = shl i64 %and9, 4
  %or11 = or i64 %and8, %shl10
  store i64 %or11, ptr %x, align 8
  %8 = load i64, ptr %x, align 8
  %shr12 = lshr i64 %8, 8
  %and13 = and i64 %shr12, 71777214294589695
  %9 = load i64, ptr %x, align 8
  %and14 = and i64 %9, 71777214294589695
  %shl15 = shl i64 %and14, 8
  %or16 = or i64 %and13, %shl15
  store i64 %or16, ptr %x, align 8
  %10 = load i64, ptr %x, align 8
  %shr17 = lshr i64 %10, 16
  %and18 = and i64 %shr17, 281470681808895
  %11 = load i64, ptr %x, align 8
  %and19 = and i64 %11, 281470681808895
  %shl20 = shl i64 %and19, 16
  %or21 = or i64 %and18, %shl20
  store i64 %or21, ptr %x, align 8
  %12 = load i64, ptr %x, align 8
  %shr22 = lshr i64 %12, 32
  %13 = load i64, ptr %x, align 8
  %shl23 = shl i64 %13, 32
  %or24 = or i64 %shr22, %shl23
  store i64 %or24, ptr %x, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %k, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, ptr %k, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %15 = load i64, ptr %x, align 8
  ret i64 %15
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
