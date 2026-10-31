; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_4.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/1_mix_4.c"
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
  %qb = alloca i32, align 4
  %qg = alloca i32, align 4
  store i32 %c0, ptr %c0.addr, align 4
  store i32 %c1, ptr %c1.addr, align 4
  %0 = load i32, ptr %c0.addr, align 4
  %and = and i32 %0, 31
  %mul = mul nsw i32 2, %and
  %1 = load i32, ptr %c1.addr, align 4
  %and1 = and i32 %1, 31
  %add = add nsw i32 %mul, %and1
  store i32 %add, ptr %blue, align 4
  %2 = load i32, ptr %c0.addr, align 4
  %and2 = and i32 %2, 992
  %shr = ashr i32 %and2, 5
  %mul3 = mul nsw i32 2, %shr
  %3 = load i32, ptr %c1.addr, align 4
  %and4 = and i32 %3, 992
  %shr5 = ashr i32 %and4, 5
  %add6 = add nsw i32 %mul3, %shr5
  store i32 %add6, ptr %green, align 4
  %4 = load i32, ptr %c0.addr, align 4
  %shr7 = ashr i32 %4, 10
  %mul8 = mul nsw i32 2, %shr7
  %5 = load i32, ptr %c1.addr, align 4
  %shr9 = ashr i32 %5, 10
  %add10 = add nsw i32 %mul8, %shr9
  store i32 %add10, ptr %red, align 4
  %6 = load i32, ptr %blue, align 4
  %mul11 = mul nsw i32 %6, 43691
  %shr12 = ashr i32 %mul11, 17
  store i32 %shr12, ptr %qb, align 4
  %7 = load i32, ptr %green, align 4
  %mul13 = mul nsw i32 %7, 43691
  %shr14 = ashr i32 %mul13, 17
  store i32 %shr14, ptr %qg, align 4
  %8 = load i32, ptr %red, align 4
  %div = sdiv i32 %8, 3
  %mul15 = mul nsw i32 %div, 1024
  %9 = load i32, ptr %qg, align 4
  %mul16 = mul nsw i32 %9, 32
  %add17 = add nsw i32 %mul15, %mul16
  %10 = load i32, ptr %qb, align 4
  %add18 = add nsw i32 %add17, %10
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
