; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r2/functions/ffmpeg/variants/c/1_mix_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r2/functions/ffmpeg/variants/c/1_mix_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @mix(i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @mix(i32 noundef %c0, i32 noundef %c1) #0 {
entry:
  %c0.addr = alloca i32, align 4
  %c1.addr = alloca i32, align 4
  %first = alloca [3 x i32], align 4
  %second = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  %arrayidx = getelementptr inbounds [3 x i32], ptr %first, i64 0, i64 0
  store i32 %and, ptr %arrayidx, align 4
  %1 = load i32, ptr %c0.addr, align 4
  %and1 = and i32 %1, 992
  %shr = ashr i32 %and1, 5
  %arrayidx2 = getelementptr inbounds [3 x i32], ptr %first, i64 0, i64 1
  store i32 %shr, ptr %arrayidx2, align 4
  %2 = load i32, ptr %c0.addr, align 4
  %shr3 = ashr i32 %2, 10
  %arrayidx4 = getelementptr inbounds [3 x i32], ptr %first, i64 0, i64 2
  store i32 %shr3, ptr %arrayidx4, align 4
  %3 = load i32, ptr %c1.addr, align 4
  %and5 = and i32 %3, 31
  %arrayidx6 = getelementptr inbounds [3 x i32], ptr %second, i64 0, i64 0
  store i32 %and5, ptr %arrayidx6, align 4
  %4 = load i32, ptr %c1.addr, align 4
  %and7 = and i32 %4, 992
  %shr8 = ashr i32 %and7, 5
  %arrayidx9 = getelementptr inbounds [3 x i32], ptr %second, i64 0, i64 1
  store i32 %shr8, ptr %arrayidx9, align 4
  %5 = load i32, ptr %c1.addr, align 4
  %shr10 = ashr i32 %5, 10
  %arrayidx11 = getelementptr inbounds [3 x i32], ptr %second, i64 0, i64 2
  store i32 %shr10, ptr %arrayidx11, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %6, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i32, ptr %i, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx12 = getelementptr inbounds [3 x i32], ptr %first, i64 0, i64 %idxprom
  %8 = load i32, ptr %arrayidx12, align 4
  %mul = mul nsw i32 2, %8
  %9 = load i32, ptr %i, align 4
  %idxprom13 = sext i32 %9 to i64
  %arrayidx14 = getelementptr inbounds [3 x i32], ptr %second, i64 0, i64 %idxprom13
  %10 = load i32, ptr %arrayidx14, align 4
  %add = add nsw i32 %mul, %10
  %div = sdiv i32 %add, 3
  %11 = load i32, ptr %i, align 4
  %idxprom15 = sext i32 %11 to i64
  %arrayidx16 = getelementptr inbounds [3 x i32], ptr %first, i64 0, i64 %idxprom15
  store i32 %div, ptr %arrayidx16, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, ptr %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %arrayidx17 = getelementptr inbounds [3 x i32], ptr %first, i64 0, i64 2
  %13 = load i32, ptr %arrayidx17, align 4
  %mul18 = mul nsw i32 %13, 1024
  %arrayidx19 = getelementptr inbounds [3 x i32], ptr %first, i64 0, i64 1
  %14 = load i32, ptr %arrayidx19, align 4
  %mul20 = mul nsw i32 %14, 32
  %add21 = add nsw i32 %mul18, %mul20
  %arrayidx22 = getelementptr inbounds [3 x i32], ptr %first, i64 0, i64 0
  %15 = load i32, ptr %arrayidx22, align 4
  %add23 = add nsw i32 %add21, %15
  ret i32 %add23
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
