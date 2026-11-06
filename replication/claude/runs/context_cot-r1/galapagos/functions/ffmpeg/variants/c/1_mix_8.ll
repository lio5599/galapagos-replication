; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_8.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_8.c"
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
  %blue = alloca i32, align 4
  %green = alloca i32, align 4
  %red = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  %shl = shl i32 %and, 1
  %1 = load i32, ptr %c1.addr, align 4
  %and1 = and i32 %1, 31
  %add = add nsw i32 %shl, %and1
  store i32 %add, ptr %blue, align 4
  %2 = load i32, ptr %c0.addr, align 4
  %shr = ashr i32 %2, 5
  %and2 = and i32 %shr, 31
  %shl3 = shl i32 %and2, 1
  %3 = load i32, ptr %c1.addr, align 4
  %shr4 = ashr i32 %3, 5
  %and5 = and i32 %shr4, 31
  %add6 = add nsw i32 %shl3, %and5
  store i32 %add6, ptr %green, align 4
  %4 = load i32, ptr %c0.addr, align 4
  %shr7 = ashr i32 %4, 10
  %5 = load i32, ptr %c0.addr, align 4
  %shr8 = ashr i32 %5, 10
  %add9 = add nsw i32 %shr7, %shr8
  %6 = load i32, ptr %c1.addr, align 4
  %shr10 = ashr i32 %6, 10
  %add11 = add nsw i32 %add9, %shr10
  store i32 %add11, ptr %red, align 4
  %7 = load i32, ptr %red, align 4
  %div = sdiv i32 %7, 3
  %mul = mul nsw i32 %div, 1024
  %8 = load i32, ptr %green, align 4
  %mul12 = mul nsw i32 %8, 43
  %shr13 = ashr i32 %mul12, 7
  %mul14 = mul nsw i32 %shr13, 32
  %add15 = add nsw i32 %mul, %mul14
  %9 = load i32, ptr %blue, align 4
  %mul16 = mul nsw i32 %9, 43
  %shr17 = ashr i32 %mul16, 7
  %add18 = add nsw i32 %add15, %shr17
  ret i32 %add18
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
