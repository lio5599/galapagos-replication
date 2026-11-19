; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r1/functions/ffmpeg/variants/c/1_mix_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r1/functions/ffmpeg/variants/c/1_mix_7.c"
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
  %blue = alloca i64, align 8
  %green = alloca i64, align 8
  %red = alloca i64, align 8
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  %conv = sext i32 %and to i64
  %mul = mul nsw i64 2, %conv
  %1 = load i32, ptr %c1.addr, align 4
  %and1 = and i32 %1, 31
  %conv2 = sext i32 %and1 to i64
  %add = add nsw i64 %mul, %conv2
  store i64 %add, ptr %blue, align 8
  %2 = load i32, ptr %c0.addr, align 4
  %and3 = and i32 %2, 992
  %shr = ashr i32 %and3, 5
  %conv4 = sext i32 %shr to i64
  %mul5 = mul nsw i64 2, %conv4
  %3 = load i32, ptr %c1.addr, align 4
  %and6 = and i32 %3, 992
  %shr7 = ashr i32 %and6, 5
  %conv8 = sext i32 %shr7 to i64
  %add9 = add nsw i64 %mul5, %conv8
  store i64 %add9, ptr %green, align 8
  %4 = load i32, ptr %c0.addr, align 4
  %shr10 = ashr i32 %4, 10
  %conv11 = sext i32 %shr10 to i64
  %mul12 = mul nsw i64 2, %conv11
  %5 = load i32, ptr %c1.addr, align 4
  %shr13 = ashr i32 %5, 10
  %conv14 = sext i32 %shr13 to i64
  %add15 = add nsw i64 %mul12, %conv14
  store i64 %add15, ptr %red, align 8
  %6 = load i64, ptr %red, align 8
  %div = sdiv i64 %6, 3
  %mul16 = mul nsw i64 %div, 1024
  %7 = load i64, ptr %green, align 8
  %div17 = sdiv i64 %7, 3
  %mul18 = mul nsw i64 %div17, 32
  %add19 = add nsw i64 %mul16, %mul18
  %8 = load i64, ptr %blue, align 8
  %div20 = sdiv i64 %8, 3
  %add21 = add nsw i64 %add19, %div20
  %conv22 = trunc i64 %add21 to i32
  ret i32 %conv22
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
