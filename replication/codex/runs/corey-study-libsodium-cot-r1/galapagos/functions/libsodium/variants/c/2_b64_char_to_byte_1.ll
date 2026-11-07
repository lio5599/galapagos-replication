; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_1.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  %and = and i32 %shr, 255
  %xor = xor i32 255, %and
  store i32 %xor, ptr %a, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 97
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 122, %4
  %or4 = or i32 %sub2, %sub3
  %shr5 = lshr i32 %or4, 8
  %and6 = and i32 %shr5, 255
  %xor7 = xor i32 255, %and6
  store i32 %xor7, ptr %b, align 4
  %5 = load i32, ptr %u, align 4
  %sub8 = sub i32 %5, 48
  %6 = load i32, ptr %u, align 4
  %sub9 = sub i32 57, %6
  %or10 = or i32 %sub8, %sub9
  %shr11 = lshr i32 %or10, 8
  %and12 = and i32 %shr11, 255
  %xor13 = xor i32 255, %and12
  store i32 %xor13, ptr %d, align 4
  %7 = load i32, ptr %u, align 4
  %xor14 = xor i32 %7, 43
  %sub15 = sub i32 0, %xor14
  %shr16 = lshr i32 %sub15, 8
  %and17 = and i32 %shr16, 255
  %xor18 = xor i32 255, %and17
  store i32 %xor18, ptr %p, align 4
  %8 = load i32, ptr %u, align 4
  %xor19 = xor i32 %8, 47
  %sub20 = sub i32 0, %xor19
  %shr21 = lshr i32 %sub20, 8
  %and22 = and i32 %shr21, 255
  %xor23 = xor i32 255, %and22
  store i32 %xor23, ptr %q, align 4
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %u, align 4
  %sub24 = sub i32 %10, 65
  %and25 = and i32 %9, %sub24
  %11 = load i32, ptr %b, align 4
  %12 = load i32, ptr %u, align 4
  %sub26 = sub i32 %12, 97
  %add = add i32 %sub26, 26
  %and27 = and i32 %11, %add
  %or28 = or i32 %and25, %and27
  %13 = load i32, ptr %d, align 4
  %14 = load i32, ptr %u, align 4
  %sub29 = sub i32 %14, 48
  %add30 = add i32 %sub29, 52
  %and31 = and i32 %13, %add30
  %or32 = or i32 %or28, %and31
  %15 = load i32, ptr %p, align 4
  %and33 = and i32 %15, 62
  %or34 = or i32 %or32, %and33
  %16 = load i32, ptr %q, align 4
  %and35 = and i32 %16, 63
  %or36 = or i32 %or34, %and35
  store i32 %or36, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub37 = sub i32 0, %18
  %shr38 = lshr i32 %sub37, 8
  %and39 = and i32 %shr38, 255
  %xor40 = xor i32 255, %and39
  %19 = load i32, ptr %u, align 4
  %xor41 = xor i32 %19, 65
  %sub42 = sub i32 0, %xor41
  %shr43 = lshr i32 %sub42, 8
  %and44 = and i32 %shr43, 255
  %and45 = and i32 %xor40, %and44
  %or46 = or i32 %17, %and45
  ret i32 %or46
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
