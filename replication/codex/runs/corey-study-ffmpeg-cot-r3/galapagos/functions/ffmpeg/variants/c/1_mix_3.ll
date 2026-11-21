; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-cot-r3/functions/ffmpeg/variants/c/1_mix_3.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-cot-r3/functions/ffmpeg/variants/c/1_mix_3.c"
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
  %blue0 = alloca i32, align 4
  %green0 = alloca i32, align 4
  %db = alloca i32, align 4
  %dg = alloca i32, align 4
  %blue = alloca i32, align 4
  %green = alloca i32, align 4
  %red = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  store i32 %and, ptr %blue0, align 4
  %1 = load i32, ptr %c0.addr, align 4
  %and1 = and i32 %1, 992
  %shr = ashr i32 %and1, 5
  store i32 %shr, ptr %green0, align 4
  %2 = load i32, ptr %c1.addr, align 4
  %and2 = and i32 %2, 31
  %3 = load i32, ptr %blue0, align 4
  %sub = sub nsw i32 %and2, %3
  store i32 %sub, ptr %db, align 4
  %4 = load i32, ptr %c1.addr, align 4
  %and3 = and i32 %4, 992
  %shr4 = ashr i32 %and3, 5
  %5 = load i32, ptr %green0, align 4
  %sub5 = sub nsw i32 %shr4, %5
  store i32 %sub5, ptr %dg, align 4
  %6 = load i32, ptr %blue0, align 4
  %7 = load i32, ptr %db, align 4
  %8 = load i32, ptr %db, align 4
  %cmp = icmp slt i32 %8, 0
  %9 = zext i1 %cmp to i64
  %cond = select i1 %cmp, i32 2, i32 0
  %sub6 = sub nsw i32 %7, %cond
  %div = sdiv i32 %sub6, 3
  %add = add nsw i32 %6, %div
  store i32 %add, ptr %blue, align 4
  %10 = load i32, ptr %green0, align 4
  %11 = load i32, ptr %dg, align 4
  %12 = load i32, ptr %dg, align 4
  %cmp7 = icmp slt i32 %12, 0
  %13 = zext i1 %cmp7 to i64
  %cond8 = select i1 %cmp7, i32 2, i32 0
  %sub9 = sub nsw i32 %11, %cond8
  %div10 = sdiv i32 %sub9, 3
  %add11 = add nsw i32 %10, %div10
  store i32 %add11, ptr %green, align 4
  %14 = load i32, ptr %c0.addr, align 4
  %shr12 = ashr i32 %14, 10
  %mul = mul nsw i32 2, %shr12
  %15 = load i32, ptr %c1.addr, align 4
  %shr13 = ashr i32 %15, 10
  %add14 = add nsw i32 %mul, %shr13
  store i32 %add14, ptr %red, align 4
  %16 = load i32, ptr %red, align 4
  %div15 = sdiv i32 %16, 3
  %mul16 = mul nsw i32 %div15, 1024
  %17 = load i32, ptr %green, align 4
  %mul17 = mul nsw i32 %17, 32
  %add18 = add nsw i32 %mul16, %mul17
  %18 = load i32, ptr %blue, align 4
  %add19 = add nsw i32 %add18, %18
  ret i32 %add19
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
