; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/0_b64_byte_to_char_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/0_b64_byte_to_char_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %lo = alloca i32, align 4
  %hi = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %and = and i32 %0, 255
  store i32 %and, ptr %lo, align 4
  %1 = load i32, ptr %x.addr, align 4
  %shr = lshr i32 %1, 8
  store i32 %shr, ptr %hi, align 4
  %2 = load i32, ptr %hi, align 4
  %3 = load i32, ptr %lo, align 4
  %cmp = icmp ult i32 %3, 26
  %conv = zext i1 %cmp to i32
  %sub = sub i32 %2, %conv
  %and1 = and i32 %sub, 255
  store i32 %and1, ptr %a, align 4
  %4 = load i32, ptr %hi, align 4
  %5 = load i32, ptr %lo, align 4
  %cmp2 = icmp ult i32 %5, 52
  %conv3 = zext i1 %cmp2 to i32
  %sub4 = sub i32 %4, %conv3
  %and5 = and i32 %sub4, 255
  store i32 %and5, ptr %b, align 4
  %6 = load i32, ptr %hi, align 4
  %7 = load i32, ptr %lo, align 4
  %cmp6 = icmp ult i32 %7, 62
  %conv7 = zext i1 %cmp6 to i32
  %sub8 = sub i32 %6, %conv7
  %and9 = and i32 %sub8, 255
  store i32 %and9, ptr %c, align 4
  %8 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %8, 62
  %sub10 = sub i32 0, %xor
  %shr11 = lshr i32 %sub10, 8
  %and12 = and i32 %shr11, 255
  %xor13 = xor i32 %and12, 255
  store i32 %xor13, ptr %d, align 4
  %9 = load i32, ptr %x.addr, align 4
  %xor14 = xor i32 %9, 63
  %sub15 = sub i32 0, %xor14
  %shr16 = lshr i32 %sub15, 8
  %and17 = and i32 %shr16, 255
  %xor18 = xor i32 %and17, 255
  store i32 %xor18, ptr %e, align 4
  %10 = load i32, ptr %a, align 4
  %11 = load i32, ptr %x.addr, align 4
  %add = add i32 %11, 65
  %and19 = and i32 %10, %add
  %12 = load i32, ptr %a, align 4
  %not = xor i32 %12, -1
  %13 = load i32, ptr %b, align 4
  %and20 = and i32 %not, %13
  %14 = load i32, ptr %x.addr, align 4
  %add21 = add i32 %14, 71
  %and22 = and i32 %and20, %add21
  %or = or i32 %and19, %and22
  %15 = load i32, ptr %b, align 4
  %not23 = xor i32 %15, -1
  %16 = load i32, ptr %c, align 4
  %and24 = and i32 %not23, %16
  %17 = load i32, ptr %x.addr, align 4
  %add25 = add i32 %17, -4
  %and26 = and i32 %and24, %add25
  %or27 = or i32 %or, %and26
  %18 = load i32, ptr %d, align 4
  %and28 = and i32 %18, 43
  %or29 = or i32 %or27, %and28
  %19 = load i32, ptr %e, align 4
  %and30 = and i32 %19, 47
  %or31 = or i32 %or29, %and30
  ret i32 %or31
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
