; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_5.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_5.c"
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
  %a = alloca i64, align 8
  %b = alloca i64, align 8
  %blue = alloca i64, align 8
  %green = alloca i64, align 8
  %red = alloca i64, align 8
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %conv = sext i32 %0 to i64
  store i64 %conv, ptr %a, align 8
  %1 = load i32, ptr %c1.addr, align 4
  %conv1 = sext i32 %1 to i64
  store i64 %conv1, ptr %b, align 8
  %2 = load i64, ptr %a, align 8
  %and = and i64 %2, 31
  %mul = mul nsw i64 2, %and
  %3 = load i64, ptr %b, align 8
  %and2 = and i64 %3, 31
  %add = add nsw i64 %mul, %and2
  store i64 %add, ptr %blue, align 8
  %4 = load i64, ptr %a, align 8
  %and3 = and i64 %4, 992
  %mul4 = mul nsw i64 2, %and3
  %5 = load i64, ptr %b, align 8
  %and5 = and i64 %5, 992
  %add6 = add nsw i64 %mul4, %and5
  %shr = ashr i64 %add6, 5
  store i64 %shr, ptr %green, align 8
  %6 = load i64, ptr %a, align 8
  %shr7 = ashr i64 %6, 10
  %mul8 = mul nsw i64 2, %shr7
  %7 = load i64, ptr %b, align 8
  %shr9 = ashr i64 %7, 10
  %add10 = add nsw i64 %mul8, %shr9
  store i64 %add10, ptr %red, align 8
  %8 = load i64, ptr %red, align 8
  %div = sdiv i64 %8, 3
  %mul11 = mul nsw i64 %div, 1024
  %9 = load i64, ptr %green, align 8
  %div12 = sdiv i64 %9, 3
  %mul13 = mul nsw i64 %div12, 32
  %add14 = add nsw i64 %mul11, %mul13
  %10 = load i64, ptr %blue, align 8
  %div15 = sdiv i64 %10, 3
  %add16 = add nsw i64 %add14, %div15
  %conv17 = trunc i64 %add16 to i32
  ret i32 %conv17
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
