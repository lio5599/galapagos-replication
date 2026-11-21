; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r2/functions/ffmpeg/variants/c/1_mix_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r2/functions/ffmpeg/variants/c/1_mix_8.c"
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
  %sums = alloca [2 x i32], align 4
  %quotients = alloca [2 x i32], align 4
  %red = alloca i32, align 4
  %i = alloca i32, align 4
  %low = alloca i32, align 4
  %high = alloca i32, align 4
  %middle = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %shr = ashr i32 %0, 10
  %mul = mul nsw i32 2, %shr
  %1 = load i32, ptr %c1.addr, align 4
  %shr1 = ashr i32 %1, 10
  %add = add nsw i32 %mul, %shr1
  store i32 %add, ptr %red, align 4
  %2 = load i32, ptr %c0.addr, align 4
  %and = and i32 %2, 31
  %mul2 = mul nsw i32 2, %and
  %3 = load i32, ptr %c1.addr, align 4
  %and3 = and i32 %3, 31
  %add4 = add nsw i32 %mul2, %and3
  %arrayidx = getelementptr inbounds [2 x i32], ptr %sums, i64 0, i64 0
  store i32 %add4, ptr %arrayidx, align 4
  %4 = load i32, ptr %c0.addr, align 4
  %and5 = and i32 %4, 992
  %shr6 = ashr i32 %and5, 5
  %mul7 = mul nsw i32 2, %shr6
  %5 = load i32, ptr %c1.addr, align 4
  %and8 = and i32 %5, 992
  %shr9 = ashr i32 %and8, 5
  %add10 = add nsw i32 %mul7, %shr9
  %arrayidx11 = getelementptr inbounds [2 x i32], ptr %sums, i64 0, i64 1
  store i32 %add10, ptr %arrayidx11, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %6, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %low, align 4
  store i32 32, ptr %high, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %for.body
  %7 = load i32, ptr %high, align 4
  %8 = load i32, ptr %low, align 4
  %sub = sub nsw i32 %7, %8
  %cmp12 = icmp sgt i32 %sub, 1
  br i1 %cmp12, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %9 = load i32, ptr %low, align 4
  %10 = load i32, ptr %high, align 4
  %add13 = add nsw i32 %9, %10
  %div = sdiv i32 %add13, 2
  store i32 %div, ptr %middle, align 4
  %11 = load i32, ptr %middle, align 4
  %mul14 = mul nsw i32 3, %11
  %12 = load i32, ptr %i, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx15 = getelementptr inbounds [2 x i32], ptr %sums, i64 0, i64 %idxprom
  %13 = load i32, ptr %arrayidx15, align 4
  %cmp16 = icmp sle i32 %mul14, %13
  br i1 %cmp16, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %14 = load i32, ptr %middle, align 4
  store i32 %14, ptr %low, align 4
  br label %if.end

if.else:                                          ; preds = %while.body
  %15 = load i32, ptr %middle, align 4
  store i32 %15, ptr %high, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %16 = load i32, ptr %low, align 4
  %17 = load i32, ptr %i, align 4
  %idxprom17 = sext i32 %17 to i64
  %arrayidx18 = getelementptr inbounds [2 x i32], ptr %quotients, i64 0, i64 %idxprom17
  store i32 %16, ptr %arrayidx18, align 4
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %18 = load i32, ptr %i, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %19 = load i32, ptr %red, align 4
  %div19 = sdiv i32 %19, 3
  %mul20 = mul nsw i32 %div19, 1024
  %arrayidx21 = getelementptr inbounds [2 x i32], ptr %quotients, i64 0, i64 1
  %20 = load i32, ptr %arrayidx21, align 4
  %mul22 = mul nsw i32 %20, 32
  %add23 = add nsw i32 %mul20, %mul22
  %arrayidx24 = getelementptr inbounds [2 x i32], ptr %quotients, i64 0, i64 0
  %21 = load i32, ptr %arrayidx24, align 4
  %add25 = add nsw i32 %add23, %21
  ret i32 %add25
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
