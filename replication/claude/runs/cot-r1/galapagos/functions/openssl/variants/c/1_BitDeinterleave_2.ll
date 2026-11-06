; ModuleID = '/home/liolsen/galapagos-replication/functions/openssl/variants/c/1_BitDeinterleave_2.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/openssl/variants/c/1_BitDeinterleave_2.c"
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
  %and = and i64 %2, 71777214294589695
  %shl = shl i64 %and, 8
  %3 = load i64, ptr %x, align 8
  %shr = lshr i64 %3, 8
  %and1 = and i64 %shr, 71777214294589695
  %or = or i64 %shl, %and1
  store i64 %or, ptr %x, align 8
  %4 = load i64, ptr %x, align 8
  %and2 = and i64 %4, 281470681808895
  %shl3 = shl i64 %and2, 16
  %5 = load i64, ptr %x, align 8
  %shr4 = lshr i64 %5, 16
  %and5 = and i64 %shr4, 281470681808895
  %or6 = or i64 %shl3, %and5
  store i64 %or6, ptr %x, align 8
  %6 = load i64, ptr %x, align 8
  %shl7 = shl i64 %6, 32
  %7 = load i64, ptr %x, align 8
  %shr8 = lshr i64 %7, 32
  %or9 = or i64 %shl7, %shr8
  store i64 %or9, ptr %x, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, ptr %k, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, ptr %k, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %9 = load i64, ptr %x, align 8
  ret i64 %9
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
