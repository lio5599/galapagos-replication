; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r2/functions/ffmpeg/variants/c/1_mix_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r2/functions/ffmpeg/variants/c/1_mix_3.c"
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
  %channels = alloca [3 x i32], align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  %mul = mul nsw i32 2, %and
  %1 = load i32, ptr %c1.addr, align 4
  %and1 = and i32 %1, 31
  %add = add nsw i32 %mul, %and1
  %arrayidx = getelementptr inbounds [3 x i32], ptr %channels, i64 0, i64 0
  store i32 %add, ptr %arrayidx, align 4
  %2 = load i32, ptr %c0.addr, align 4
  %and2 = and i32 %2, 992
  %mul3 = mul nsw i32 2, %and2
  %3 = load i32, ptr %c1.addr, align 4
  %and4 = and i32 %3, 992
  %add5 = add nsw i32 %mul3, %and4
  %shr = ashr i32 %add5, 5
  %arrayidx6 = getelementptr inbounds [3 x i32], ptr %channels, i64 0, i64 1
  store i32 %shr, ptr %arrayidx6, align 4
  %4 = load i32, ptr %c0.addr, align 4
  %shr7 = ashr i32 %4, 10
  %mul8 = mul nsw i32 2, %shr7
  %5 = load i32, ptr %c1.addr, align 4
  %shr9 = ashr i32 %5, 10
  %add10 = add nsw i32 %mul8, %shr9
  %arrayidx11 = getelementptr inbounds [3 x i32], ptr %channels, i64 0, i64 2
  store i32 %add10, ptr %arrayidx11, align 4
  %arrayidx12 = getelementptr inbounds [3 x i32], ptr %channels, i64 0, i64 0
  %6 = load i32, ptr %arrayidx12, align 4
  %div = sdiv i32 %6, 3
  store i32 %div, ptr %arrayidx12, align 4
  %arrayidx13 = getelementptr inbounds [3 x i32], ptr %channels, i64 0, i64 1
  %7 = load i32, ptr %arrayidx13, align 4
  %div14 = sdiv i32 %7, 3
  store i32 %div14, ptr %arrayidx13, align 4
  %arrayidx15 = getelementptr inbounds [3 x i32], ptr %channels, i64 0, i64 2
  %8 = load i32, ptr %arrayidx15, align 4
  %div16 = sdiv i32 %8, 3
  store i32 %div16, ptr %arrayidx15, align 4
  %arrayidx17 = getelementptr inbounds [3 x i32], ptr %channels, i64 0, i64 2
  %9 = load i32, ptr %arrayidx17, align 4
  %mul18 = mul nsw i32 %9, 1024
  %arrayidx19 = getelementptr inbounds [3 x i32], ptr %channels, i64 0, i64 1
  %10 = load i32, ptr %arrayidx19, align 4
  %mul20 = mul nsw i32 %10, 32
  %add21 = add nsw i32 %mul18, %mul20
  %arrayidx22 = getelementptr inbounds [3 x i32], ptr %channels, i64 0, i64 0
  %11 = load i32, ptr %arrayidx22, align 4
  %add23 = add nsw i32 %add21, %11
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
