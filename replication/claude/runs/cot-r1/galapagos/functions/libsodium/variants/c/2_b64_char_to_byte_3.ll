; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_3.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_3.c"
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
  %w = alloca i32, align 4
  %up = alloca i32, align 4
  %lo = alloca i32, align 4
  %dg = alloca i32, align 4
  %pl = alloca i32, align 4
  %sl = alloca i32, align 4
  %hi = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  %and = and i32 %0, 65535
  store i32 %and, ptr %w, align 4
  %1 = load i32, ptr %w, align 4
  %sub = sub i32 %1, 65
  %cmp = icmp ult i32 %sub, 26
  %conv = zext i1 %cmp to i32
  %sub1 = sub i32 0, %conv
  store i32 %sub1, ptr %up, align 4
  %2 = load i32, ptr %w, align 4
  %sub2 = sub i32 %2, 97
  %cmp3 = icmp ult i32 %sub2, 26
  %conv4 = zext i1 %cmp3 to i32
  %sub5 = sub i32 0, %conv4
  store i32 %sub5, ptr %lo, align 4
  %3 = load i32, ptr %w, align 4
  %sub6 = sub i32 %3, 48
  %cmp7 = icmp ult i32 %sub6, 10
  %conv8 = zext i1 %cmp7 to i32
  %sub9 = sub i32 0, %conv8
  store i32 %sub9, ptr %dg, align 4
  %4 = load i32, ptr %w, align 4
  %cmp10 = icmp eq i32 %4, 43
  %conv11 = zext i1 %cmp10 to i32
  %sub12 = sub i32 0, %conv11
  store i32 %sub12, ptr %pl, align 4
  %5 = load i32, ptr %w, align 4
  %cmp13 = icmp eq i32 %5, 47
  %conv14 = zext i1 %cmp13 to i32
  %sub15 = sub i32 0, %conv14
  store i32 %sub15, ptr %sl, align 4
  %6 = load i32, ptr %w, align 4
  %cmp16 = icmp uge i32 %6, 65280
  %conv17 = zext i1 %cmp16 to i32
  %sub18 = sub i32 0, %conv17
  store i32 %sub18, ptr %hi, align 4
  %7 = load i32, ptr %up, align 4
  %8 = load i32, ptr %w, align 4
  %sub19 = sub i32 %8, 65
  %and20 = and i32 %7, %sub19
  %9 = load i32, ptr %lo, align 4
  %10 = load i32, ptr %w, align 4
  %sub21 = sub i32 %10, 71
  %and22 = and i32 %9, %sub21
  %or = or i32 %and20, %and22
  %11 = load i32, ptr %dg, align 4
  %12 = load i32, ptr %w, align 4
  %add = add i32 %12, 4
  %and23 = and i32 %11, %add
  %or24 = or i32 %or, %and23
  %13 = load i32, ptr %pl, align 4
  %and25 = and i32 %13, 62
  %or26 = or i32 %or24, %and25
  %14 = load i32, ptr %sl, align 4
  %and27 = and i32 %14, 63
  %or28 = or i32 %or26, %and27
  %15 = load i32, ptr %hi, align 4
  %16 = load i32, ptr %w, align 4
  %cmp29 = icmp eq i32 %16, 65327
  %conv30 = zext i1 %cmp29 to i32
  %xor = xor i32 63, %conv30
  %and31 = and i32 %15, %xor
  %or32 = or i32 %or28, %and31
  store i32 %or32, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %up, align 4
  %19 = load i32, ptr %lo, align 4
  %or33 = or i32 %18, %19
  %20 = load i32, ptr %dg, align 4
  %or34 = or i32 %or33, %20
  %21 = load i32, ptr %pl, align 4
  %or35 = or i32 %or34, %21
  %22 = load i32, ptr %sl, align 4
  %or36 = or i32 %or35, %22
  %23 = load i32, ptr %hi, align 4
  %or37 = or i32 %or36, %23
  %not = xor i32 %or37, -1
  %and38 = and i32 %not, 255
  %or39 = or i32 %17, %and38
  ret i32 %or39
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
