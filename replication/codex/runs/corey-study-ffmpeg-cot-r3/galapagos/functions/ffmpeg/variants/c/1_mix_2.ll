; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-cot-r3/functions/ffmpeg/variants/c/1_mix_2.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-cot-r3/functions/ffmpeg/variants/c/1_mix_2.c"
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
  %a = alloca [2 x i32], align 4
  %b = alloca [2 x i32], align 4
  %average = alloca [2 x i32], align 4
  %red = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %arrayinit.begin = getelementptr inbounds [2 x i32], ptr %a, i64 0, i64 0
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  store i32 %and, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %1 = load i32, ptr %c0.addr, align 4
  %and1 = and i32 %1, 992
  %shr = ashr i32 %and1, 5
  store i32 %shr, ptr %arrayinit.element, align 4
  %arrayinit.begin2 = getelementptr inbounds [2 x i32], ptr %b, i64 0, i64 0
  %2 = load i32, ptr %c1.addr, align 4
  %and3 = and i32 %2, 31
  store i32 %and3, ptr %arrayinit.begin2, align 4
  %arrayinit.element4 = getelementptr inbounds i32, ptr %arrayinit.begin2, i64 1
  %3 = load i32, ptr %c1.addr, align 4
  %and5 = and i32 %3, 992
  %shr6 = ashr i32 %and5, 5
  store i32 %shr6, ptr %arrayinit.element4, align 4
  %4 = load i32, ptr %c0.addr, align 4
  %shr7 = ashr i32 %4, 10
  %mul = mul nsw i32 2, %shr7
  %5 = load i32, ptr %c1.addr, align 4
  %shr8 = ashr i32 %5, 10
  %add = add nsw i32 %mul, %shr8
  store i32 %add, ptr %red, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %6, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i32, ptr %i, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds [2 x i32], ptr %a, i64 0, i64 %idxprom
  %8 = load i32, ptr %arrayidx, align 4
  %9 = load i32, ptr %i, align 4
  %idxprom9 = sext i32 %9 to i64
  %arrayidx10 = getelementptr inbounds [2 x i32], ptr %a, i64 0, i64 %idxprom9
  %10 = load i32, ptr %arrayidx10, align 4
  %add11 = add nsw i32 %8, %10
  %11 = load i32, ptr %i, align 4
  %idxprom12 = sext i32 %11 to i64
  %arrayidx13 = getelementptr inbounds [2 x i32], ptr %b, i64 0, i64 %idxprom12
  %12 = load i32, ptr %arrayidx13, align 4
  %add14 = add nsw i32 %add11, %12
  %div = sdiv i32 %add14, 3
  %13 = load i32, ptr %i, align 4
  %idxprom15 = sext i32 %13 to i64
  %arrayidx16 = getelementptr inbounds [2 x i32], ptr %average, i64 0, i64 %idxprom15
  store i32 %div, ptr %arrayidx16, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %15 = load i32, ptr %red, align 4
  %div17 = sdiv i32 %15, 3
  %mul18 = mul nsw i32 %div17, 1024
  %arrayidx19 = getelementptr inbounds [2 x i32], ptr %average, i64 0, i64 1
  %16 = load i32, ptr %arrayidx19, align 4
  %mul20 = mul nsw i32 %16, 32
  %add21 = add nsw i32 %mul18, %mul20
  %arrayidx22 = getelementptr inbounds [2 x i32], ptr %average, i64 0, i64 0
  %17 = load i32, ptr %arrayidx22, align 4
  %add23 = add nsw i32 %add21, %17
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
