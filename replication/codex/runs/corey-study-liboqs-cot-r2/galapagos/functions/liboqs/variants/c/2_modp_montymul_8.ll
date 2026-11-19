; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r2/functions/liboqs/variants/c/2_modp_montymul_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-liboqs-cot-r2/functions/liboqs/variants/c/2_modp_montymul_8.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @modp_montymul(i32 noundef %a, i32 noundef %b, i32 noundef %p, i32 noundef %p0i) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %p.addr = alloca i32, align 4
  %p0i.addr = alloca i32, align 4
  %z = alloca i64, align 8
  %x0 = alloca i64, align 8
  %x1 = alloca i64, align 8
  %y0 = alloca i64, align 8
  %y1 = alloca i64, align 8
  %m = alloca i64, align 8
  %w = alloca i64, align 8
  %d = alloca i32, align 4
  store i32 %a, ptr %a.addr, align 4
  store i32 %b, ptr %b.addr, align 4
  store i32 %p, ptr %p.addr, align 4
  store i32 %p0i, ptr %p0i.addr, align 4
  %0 = load i32, ptr %a.addr, align 4
  %conv = zext i32 %0 to i64
  %1 = load i32, ptr %b.addr, align 4
  %conv1 = zext i32 %1 to i64
  %mul = mul i64 %conv, %conv1
  store i64 %mul, ptr %z, align 8
  %2 = load i64, ptr %z, align 8
  %and = and i64 %2, 65535
  store i64 %and, ptr %x0, align 8
  %3 = load i64, ptr %z, align 8
  %shr = lshr i64 %3, 16
  %and2 = and i64 %shr, 65535
  store i64 %and2, ptr %x1, align 8
  %4 = load i32, ptr %p0i.addr, align 4
  %and3 = and i32 %4, 65535
  %conv4 = zext i32 %and3 to i64
  store i64 %conv4, ptr %y0, align 8
  %5 = load i32, ptr %p0i.addr, align 4
  %shr5 = lshr i32 %5, 16
  %conv6 = zext i32 %shr5 to i64
  store i64 %conv6, ptr %y1, align 8
  %6 = load i64, ptr %x0, align 8
  %7 = load i64, ptr %y0, align 8
  %mul7 = mul i64 %6, %7
  %8 = load i64, ptr %x0, align 8
  %9 = load i64, ptr %y1, align 8
  %mul8 = mul i64 %8, %9
  %10 = load i64, ptr %x1, align 8
  %11 = load i64, ptr %y0, align 8
  %mul9 = mul i64 %10, %11
  %add = add i64 %mul8, %mul9
  %shl = shl i64 %add, 16
  %add10 = add i64 %mul7, %shl
  %and11 = and i64 %add10, 2147483647
  store i64 %and11, ptr %m, align 8
  %12 = load i64, ptr %m, align 8
  %13 = load i32, ptr %p.addr, align 4
  %conv12 = zext i32 %13 to i64
  %mul13 = mul i64 %12, %conv12
  store i64 %mul13, ptr %w, align 8
  %14 = load i64, ptr %z, align 8
  %15 = load i64, ptr %w, align 8
  %add14 = add i64 %14, %15
  %shr15 = lshr i64 %add14, 31
  %conv16 = trunc i64 %shr15 to i32
  %16 = load i32, ptr %p.addr, align 4
  %sub = sub i32 %conv16, %16
  store i32 %sub, ptr %d, align 4
  %17 = load i32, ptr %p.addr, align 4
  %18 = load i32, ptr %d, align 4
  %shr17 = lshr i32 %18, 31
  %sub18 = sub i32 0, %shr17
  %and19 = and i32 %17, %sub18
  %19 = load i32, ptr %d, align 4
  %add20 = add i32 %19, %and19
  store i32 %add20, ptr %d, align 4
  %20 = load i32, ptr %d, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @modp_montymul(i32 noundef 0, i32 noundef 0, i32 noundef 0, i32 noundef 0)
  ret i32 0
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
