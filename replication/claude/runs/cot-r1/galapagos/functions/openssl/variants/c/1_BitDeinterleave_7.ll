; ModuleID = '/home/liolsen/galapagos-replication/functions/openssl/variants/c/1_BitDeinterleave_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/openssl/variants/c/1_BitDeinterleave_7.c"
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
  %b = alloca [8 x i8], align 1
  %r = alloca i64, align 8
  %i = alloca i32, align 4
  store i64 %Ai, ptr %Ai.addr, align 8
  store i64 0, ptr %r, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64, ptr %Ai.addr, align 8
  %2 = load i32, ptr %i, align 4
  %mul = mul nsw i32 8, %2
  %sh_prom = zext i32 %mul to i64
  %shr = lshr i64 %1, %sh_prom
  %conv = trunc i64 %shr to i8
  %3 = load i32, ptr %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [8 x i8], ptr %b, i64 0, i64 %idxprom
  store i8 %conv, ptr %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, ptr %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc10, %for.end
  %5 = load i32, ptr %i, align 4
  %cmp2 = icmp slt i32 %5, 8
  br i1 %cmp2, label %for.body4, label %for.end12

for.body4:                                        ; preds = %for.cond1
  %6 = load i32, ptr %i, align 4
  %idxprom5 = sext i32 %6 to i64
  %arrayidx6 = getelementptr inbounds [8 x i8], ptr %b, i64 0, i64 %idxprom5
  %7 = load i8, ptr %arrayidx6, align 1
  %conv7 = zext i8 %7 to i64
  %8 = load i32, ptr %i, align 4
  %mul8 = mul nsw i32 8, %8
  %sh_prom9 = zext i32 %mul8 to i64
  %shl = shl i64 %conv7, %sh_prom9
  %9 = load i64, ptr %r, align 8
  %or = or i64 %9, %shl
  store i64 %or, ptr %r, align 8
  br label %for.inc10

for.inc10:                                        ; preds = %for.body4
  %10 = load i32, ptr %i, align 4
  %inc11 = add nsw i32 %10, 1
  store i32 %inc11, ptr %i, align 4
  br label %for.cond1, !llvm.loop !8

for.end12:                                        ; preds = %for.cond1
  %11 = load i64, ptr %r, align 8
  ret i64 %11
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
!8 = distinct !{!8, !7}
